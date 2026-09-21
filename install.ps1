[CmdletBinding()]
param(
    [string]$TargetPath = (Join-Path $env:USERPROFILE '.claude'),
    [switch]$Force,
    [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$sourceRoot = [System.IO.Path]::GetFullPath($PSScriptRoot)
$targetRoot = [System.IO.Path]::GetFullPath($TargetPath)
$managedDirectories = @('agents', 'skills')
$optionalRootFiles = @('CLAUDE.md')
$excludedPrefixes = @(
    "skills$([System.IO.Path]::DirectorySeparatorChar)synced$([System.IO.Path]::DirectorySeparatorChar)"
)

function Get-RelativePath {
    param(
        [Parameter(Mandatory)]
        [string]$BasePath,

        [Parameter(Mandatory)]
        [string]$ChildPath
    )

    return [System.IO.Path]::GetRelativePath($BasePath, $ChildPath)
}

function Test-IsExcluded {
    param(
        [Parameter(Mandatory)]
        [string]$RelativePath
    )

    foreach ($prefix in $excludedPrefixes) {
        if ($RelativePath.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
            return $true
        }
    }

    return $false
}

function Test-FilesEqual {
    param(
        [Parameter(Mandatory)]
        [string]$Source,

        [Parameter(Mandatory)]
        [string]$Destination
    )

    if (-not (Test-Path -LiteralPath $Destination -PathType Leaf)) {
        return $false
    }

    $sourceFile = Get-Item -LiteralPath $Source
    $destinationFile = Get-Item -LiteralPath $Destination

    if ($sourceFile.Length -ne $destinationFile.Length) {
        return $false
    }

    return (Get-FileHash -Algorithm SHA256 -LiteralPath $Source).Hash -eq
        (Get-FileHash -Algorithm SHA256 -LiteralPath $Destination).Hash
}

$sourceFiles = [System.Collections.Generic.List[object]]::new()

foreach ($directory in $managedDirectories) {
    $directoryPath = Join-Path $sourceRoot $directory
    if (-not (Test-Path -LiteralPath $directoryPath -PathType Container)) {
        continue
    }

    foreach ($file in Get-ChildItem -LiteralPath $directoryPath -File -Recurse -Force) {
        $relativePath = Get-RelativePath -BasePath $sourceRoot -ChildPath $file.FullName
        if (-not (Test-IsExcluded -RelativePath $relativePath)) {
            $sourceFiles.Add([pscustomobject]@{
                Source = $file.FullName
                RelativePath = $relativePath
                Destination = Join-Path $targetRoot $relativePath
            })
        }
    }
}

foreach ($fileName in $optionalRootFiles) {
    $filePath = Join-Path $sourceRoot $fileName
    if (Test-Path -LiteralPath $filePath -PathType Leaf) {
        $sourceFiles.Add([pscustomobject]@{
            Source = $filePath
            RelativePath = $fileName
            Destination = Join-Path $targetRoot $fileName
        })
    }
}

if ($sourceFiles.Count -eq 0) {
    throw 'No harness files were found. Expected agents/, skills/, or CLAUDE.md next to this script.'
}

if ($sourceRoot.TrimEnd('\', '/') -eq $targetRoot.TrimEnd('\', '/')) {
    Write-Host "Harness is already installed at $targetRoot"
    return
}

$newFiles = [System.Collections.Generic.List[object]]::new()
$changedFiles = [System.Collections.Generic.List[object]]::new()
$unchangedCount = 0

foreach ($file in $sourceFiles) {
    if (-not (Test-Path -LiteralPath $file.Destination -PathType Leaf)) {
        $newFiles.Add($file)
        continue
    }

    if (Test-FilesEqual -Source $file.Source -Destination $file.Destination) {
        $unchangedCount++
        continue
    }

    $changedFiles.Add($file)
}

if ($changedFiles.Count -gt 0 -and -not $Force) {
    Write-Host 'Installation stopped because these destination files differ:' -ForegroundColor Yellow
    $changedFiles.RelativePath | Sort-Object | ForEach-Object { Write-Host "  $_" }
    Write-Host ''
    Write-Host 'Review them, then rerun with -Force to back them up and install the repository versions.'
    throw 'Installation aborted because destination files differ.'
}

$backupRoot = $null
if ($changedFiles.Count -gt 0) {
    $timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $backupRoot = Join-Path $targetRoot "backups\harness-$timestamp"
}

Write-Host "Source: $sourceRoot"
Write-Host "Target: $targetRoot"
Write-Host "New: $($newFiles.Count), changed: $($changedFiles.Count), unchanged: $unchangedCount"

if ($DryRun) {
    if ($backupRoot) {
        Write-Host "Backup would be written to: $backupRoot"
    }
    Write-Host 'Dry run complete; no files were changed.'
    return
}

if (-not (Test-Path -LiteralPath $targetRoot -PathType Container)) {
    New-Item -ItemType Directory -Path $targetRoot -Force | Out-Null
}

foreach ($file in $changedFiles) {
    $backupPath = Join-Path $backupRoot $file.RelativePath
    $backupDirectory = Split-Path -Parent $backupPath
    New-Item -ItemType Directory -Path $backupDirectory -Force | Out-Null
    Copy-Item -LiteralPath $file.Destination -Destination $backupPath -Force
}

foreach ($file in @($newFiles) + @($changedFiles)) {
    $destinationDirectory = Split-Path -Parent $file.Destination
    New-Item -ItemType Directory -Path $destinationDirectory -Force | Out-Null
    Copy-Item -LiteralPath $file.Source -Destination $file.Destination -Force
    Write-Host "Installed $($file.RelativePath)"
}

if ($backupRoot) {
    Write-Host "Previous versions were backed up to: $backupRoot"
}

Write-Host 'Harness installation complete.' -ForegroundColor Green
