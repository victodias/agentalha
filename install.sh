#!/bin/sh

set -eu

usage() {
    cat <<'EOF'
Uso: ./install.sh [--dry-run] [--force] [--target-path CAMINHO]

  --dry-run             Mostra o que seria instalado, sem alterar o destino
  --force               Faz backup e substitui arquivos diferentes
  --target-path CAMINHO  Destino; padrão: ~/.claude
EOF
}

target_path="${HOME}/.claude"
force=false
dry_run=false

while [ "$#" -gt 0 ]; do
    case "$1" in
        --dry-run)
            dry_run=true
            ;;
        --force)
            force=true
            ;;
        --target-path)
            [ "$#" -ge 2 ] || { usage >&2; exit 2; }
            target_path=$2
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            printf 'Opção desconhecida: %s\n' "$1" >&2
            usage >&2
            exit 2
            ;;
    esac
    shift
done

source_root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
case "$target_path" in
    /*) ;;
    *) target_path="$(pwd -P)/$target_path" ;;
esac

if [ "$source_root" = "$target_path" ]; then
    printf 'Harness já está instalado em %s\n' "$target_path"
    exit 0
fi

tmp_dir=$(mktemp -d)
trap 'rm -rf -- "$tmp_dir"' EXIT HUP INT TERM

: > "$tmp_dir/files"
: > "$tmp_dir/new"
: > "$tmp_dir/changed"

for directory in agents skills; do
    if [ -d "$source_root/$directory" ]; then
        find "$source_root/$directory" -type f \
            ! -path "$source_root/skills/synced/*" \
            -print >> "$tmp_dir/files"
    fi
done

if [ -f "$source_root/CLAUDE.md" ]; then
    printf '%s\n' "$source_root/CLAUDE.md" >> "$tmp_dir/files"
fi

if [ ! -s "$tmp_dir/files" ]; then
    printf 'Nenhum arquivo encontrado em agents/, skills/ ou CLAUDE.md.\n' >&2
    exit 1
fi

unchanged=0
while IFS= read -r source_file; do
    relative_path=${source_file#"$source_root"/}
    destination_file=$target_path/$relative_path

    if [ -d "$destination_file" ]; then
        printf 'Conflito: o destino é um diretório: %s\n' "$destination_file" >&2
        exit 1
    elif [ ! -e "$destination_file" ]; then
        printf '%s\n' "$relative_path" >> "$tmp_dir/new"
    elif cmp -s -- "$source_file" "$destination_file"; then
        unchanged=$((unchanged + 1))
    else
        printf '%s\n' "$relative_path" >> "$tmp_dir/changed"
    fi
done < "$tmp_dir/files"

new_count=$(wc -l < "$tmp_dir/new" | tr -d ' ')
changed_count=$(wc -l < "$tmp_dir/changed" | tr -d ' ')

if [ "$changed_count" -gt 0 ] && [ "$force" = false ]; then
    printf 'Instalação interrompida: estes arquivos no destino são diferentes:\n' >&2
    sort "$tmp_dir/changed" >&2
    printf '\nRevise-os e use --force para salvar backup e substituí-los.\n' >&2
    exit 1
fi

backup_root=
if [ "$changed_count" -gt 0 ]; then
    backup_root="$target_path/backups/harness-$(date +%Y%m%d-%H%M%S)-$$"
fi

printf 'Origem: %s\nDestino: %s\n' "$source_root" "$target_path"
printf 'Novos: %s, alterados: %s, inalterados: %s\n' \
    "$new_count" "$changed_count" "$unchanged"

if [ "$dry_run" = true ]; then
    if [ -n "$backup_root" ]; then
        printf 'Backup seria criado em: %s\n' "$backup_root"
    fi
    printf 'Simulação concluída; destino não alterado.\n'
    exit 0
fi

mkdir -p -- "$target_path"

if [ "$changed_count" -gt 0 ]; then
    while IFS= read -r relative_path; do
        backup_file=$backup_root/$relative_path
        mkdir -p -- "$(dirname -- "$backup_file")"
        cp -p -- "$target_path/$relative_path" "$backup_file"
    done < "$tmp_dir/changed"
fi

cat "$tmp_dir/new" "$tmp_dir/changed" | while IFS= read -r relative_path; do
    destination_file=$target_path/$relative_path
    mkdir -p -- "$(dirname -- "$destination_file")"
    cp -p -- "$source_root/$relative_path" "$destination_file"
    printf 'Instalado: %s\n' "$relative_path"
done

if [ -n "$backup_root" ]; then
    printf 'Versões anteriores salvas em: %s\n' "$backup_root"
fi

printf 'Instalação concluída.\n'