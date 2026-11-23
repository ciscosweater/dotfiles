# dotfiles

[Umbriel](https://github.com/noctalia-dev/umbriel) + [Noctalia](https://github.com/noctalia-dev/noctalia) no CachyOS,
com o tema do sistema inteiro (compositor, Qt, GTK, terminal, ícones, fzf…) gerado automaticamente a partir do wallpaper.

Também tem a config do [niri](https://github.com/niri-wm/niri) com os mesmos atalhos e o mesmo visual, para quem preferir.

## Dependências

No CachyOS (Umbriel, Noctalia e Zen estão nos repositórios do CachyOS):

```sh
sudo pacman -S --needed umbriel xdg-desktop-portal-umbriel noctalia \
    kitty fish fzf nautilus zen-browser-bin zed \
    qt5ct qt6ct papirus-icon-theme adw-gtk-theme archlinux-xdg-menu \
    noto-fonts adwaita-fonts adobe-source-code-pro-fonts \
    gnome-keyring xdg-desktop-portal-gnome xdg-desktop-portal-gtk
paru -S darkly bibata-cursor-theme-bin   # AUR (ou yay)
```

- **Zen, Nautilus e Zed** só aparecem nos atalhos — troque em `umbriel/keybinds.toml` se usar outros.
- **niri** é opcional: `sudo pacman -S niri`.

Testado com Umbriel 0.1.0, Noctalia 5.6 e niri 26.04.

## O que tem aqui

| Pasta | Vai para |
|---|---|
| `umbriel/` | `~/.config/umbriel/` — config principal + atalhos |
| `niri/` | `~/.config/niri/` — alternativa: config dividida em `cfg/*.kdl` |
| `noctalia/config.toml` | `~/.config/noctalia/` — registra os templates próprios |
| `noctalia/templates/` | `~/.config/noctalia/templates/` — niri (gradiente no anel de foco + sombra), fzf, OpenBot, Fluxer, qt5ct/qt6ct e pastas do Papirus |
| `noctalia/settings.toml` | `~/.local/state/noctalia/` — o que é configurado pela interface (barra, tema, templates ligados) |
| `fish/conf.d/` | `~/.config/fish/conf.d/` — aponta o fzf para as cores geradas |
| `qt/` | `~/.config/qt5ct/`, `~/.config/qt6ct/` — Qt6 com Darkly, Qt5 com Fusion, ambos com a paleta do Noctalia |
| `session/` | `~/.config/environment.d/` e `~/.config/xdg-desktop-portal/` — variáveis de ambiente e portais |

Os arquivos de cores que o Noctalia gera a cada troca de wallpaper (`~/.config/umbriel/noctalia.toml`,
`~/.config/niri/noctalia.kdl` e `noctalia-extra.kdl`) **não** ficam no repo.

## Instalação

```sh
git clone https://github.com/ciscosweater/dotfiles
cd dotfiles
./install.sh
```

> [!WARNING]
> O `install.sh` **substitui** as suas configs desses programas. O que for sobrescrito
> ganha um backup ao lado (`arquivo.bak-<data>`), mas leia a tabela acima antes.
> Ele também liga o tema GTK `adw-gtk3-dark`, o modo escuro e o cursor Bibata (via `gsettings`).

Depois de instalar:
1. Saia da sessão e entre de novo escolhendo **Umbriel** na tela de login.
2. Escolha um wallpaper (`Super+Shift+Enter`) — o tema todo é gerado a partir dele.
   Na primeira vez, o template do Papirus copia o tema de ícones para `~/.local/share/icons`
   (é lá que ele recolore as pastas, sem precisar de sudo).
3. **Monitores**: modo, posição e escala são automáticos. O `umbriel/config.toml` traz um exemplo
   comentado de ajuste por monitor (no niri, `niri/cfg/display.kdl`; `niri msg outputs` lista os nomes).
4. **Teclado**: vale o layout do sistema. Para forçar outro, veja `[input.keyboard]` no `umbriel/config.toml`.

## Atalhos principais

`Super+Shift+Esc` mostra todos.

| Atalho | Ação |
|---|---|
| `Super+Enter` | Terminal (kitty) |
| `Super+Espaço` | Launcher |
| `Super+B` / `Super+E` | Navegador / Arquivos |
| `Super+S` | Central de controle |
| `Super+Ctrl+S` | Configurações do Noctalia |
| `Super+Shift+Enter` | Wallpaper |
| `Super+Q` | Fechar janela |
| `Super+T` / `Super+F` / `Super+Shift+F` | Flutuar / Maximizar / Tela cheia |
| `Super+setas` ou `Super+H/J/K/L` | Mover o foco |
| `Super+Ctrl+setas` | Mover a janela |
| `Super+1…9` / `Super+Ctrl+1…9` | Ir para / mover janela para o workspace |
| `Super+Shift+S` | Print de uma região |
| `Super+Alt+L` / `Super+Shift+Q` | Bloquear / Menu de sessão |

## Manutenção

```sh
./sync.sh      # sistema -> repo (depois git add/commit)
./install.sh   # repo -> sistema
```

Caminhos absolutos da home ficam como `@HOME@` no repo; o `install.sh` troca pela home de quem instala.
Para versionar outro arquivo, adicione uma linha em `files.sh`.

## Licença

[MIT](LICENSE). `noctalia/templates/papirus/papirus-folders` é do
[Papirus Development Team](https://github.com/PapirusDevelopmentTeam/papirus-folders) (MIT).
