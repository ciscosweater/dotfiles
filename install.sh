#!/usr/bin/env bash
# Copia as configs do repo para o sistema, fazendo backup do que já existir.
# O marcador @HOME@ é trocado pela sua home.
# Uso: ./install.sh
set -euo pipefail
cd "$(dirname "$0")"
source ./files.sh

ts="$(date +%Y%m%d-%H%M%S)"
tmp="$(mktemp)"; chmod 644 "$tmp"
trap 'rm -f "$tmp"' EXIT

for entry in "${FILES[@]}"; do
    src="${entry%%:*}"
    dst="$HOME/${entry#*:}"
    [ -e "$src" ] || continue
    sed "s|@HOME@|$HOME|g" "$src" > "$tmp"
    mkdir -p "$(dirname "$dst")"
    if [ -e "$dst" ] && ! cmp -s "$tmp" "$dst"; then
        cp "$dst" "$dst.bak-$ts"
        echo "backup: $dst.bak-$ts"
    fi
    cp "$tmp" "$dst"
    [ -x "$src" ] && chmod +x "$dst"
done

# A config do niri inclui arquivos gerados pelo Noctalia; numa instalação nova
# eles ainda não existem e o niri recusaria a config. Cria vazios até ele gerar.
for f in noctalia.kdl noctalia-extra.kdl; do
    [ -e "$HOME/.config/niri/$f" ] || touch "$HOME/.config/niri/$f"
done

# GTK: o template do Noctalia pinta o adw-gtk3; liga o tema escuro e o cursor, se instalados.
if command -v gsettings >/dev/null; then
    for d in /usr/share/themes ~/.local/share/themes; do
        if [ -d "$d/adw-gtk3-dark" ]; then
            gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
            break
        fi
    done
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    for d in /usr/share/icons ~/.local/share/icons; do
        if [ -d "$d/Bibata-Modern-Ice" ]; then
            gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice
            break
        fi
    done
fi

# Os arquivos noctalia.kdl / noctalia-extra.kdl são gerados pelo Noctalia
# a partir do wallpaper; peça para ele regenerar.
if command -v noctalia >/dev/null && noctalia msg config-reload >/dev/null 2>&1; then
    noctalia msg templates-apply >/dev/null 2>&1 || true
fi
command -v niri >/dev/null && niri validate
command -v umbriel >/dev/null && umbriel config validate
echo "ok"
