# Claude harness

Personal, portable Claude configuration containing authored agents and skills.

## Included

- `agents/`
- `skills/`, except `skills/synced/`
- optional root-level `CLAUDE.md`

Claude runtime state, credentials, sessions, logs, caches, backups, downloaded
plugins, and machine-specific settings are intentionally excluded.

## Install on Windows

Clone the repository anywhere, then run:

```powershell
.\install.ps1 -DryRun
.\install.ps1
```

The default destination is `$env:USERPROFILE\.claude`. To use another path:

```powershell
.\install.ps1 -TargetPath 'D:\path\to\.claude'
```

The installer is additive: it does not delete destination files. If an existing
file differs, installation stops before making changes. Review the reported
conflicts and, when appropriate, rerun with `-Force`; the previous versions will
be saved under `.claude\backups\harness-<timestamp>` before being overwritten.

## Publish

Review exactly what Git will include before the first commit:

```powershell
git status --short
git add .gitignore README.md install.ps1 agents skills
git status --short
git diff --cached
```

Run a secret scanner before pushing when one is available. Keep the GitHub
repository private unless every tracked file has been reviewed for information
that should not be public.
