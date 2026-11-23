#!/usr/bin/env bash
# Copia as configs atuais do sistema para dentro do repo.
# Caminhos com a home viram o marcador @HOME@ (o install.sh desfaz).
# Uso: ./sync.sh   (depois: git add -A && git commit)
set -euo pipefail
cd "$(dirname "$0")"
source ./files.sh

for entry in "${FILES[@]}"; do
    src="$HOME/${entry#*:}"
    dst="${entry%%:*}"
    if [ -e "$src" ]; then
        mkdir -p "$(dirname "$dst")"
        cp "$src" "$dst"
        sed -i "s|$HOME|@HOME@|g" "$dst"
    else
        echo "aviso: $src não existe, pulando" >&2
    fi
done
echo "ok — rode 'git status' para ver o que mudou"
