# Lista de arquivos versionados: "caminho/no/repo:caminho/relativo/à/home"
FILES=(
    # Umbriel (compositor principal: config + atalhos)
    "umbriel/config.toml:.config/umbriel/config.toml"
    "umbriel/keybinds.toml:.config/umbriel/keybinds.toml"

    # niri (compositor alternativo)
    "niri/config.kdl:.config/niri/config.kdl"
    "niri/cfg/animation.kdl:.config/niri/cfg/animation.kdl"
    "niri/cfg/autostart.kdl:.config/niri/cfg/autostart.kdl"
    "niri/cfg/display.kdl:.config/niri/cfg/display.kdl"
    "niri/cfg/input.kdl:.config/niri/cfg/input.kdl"
    "niri/cfg/keybinds.kdl:.config/niri/cfg/keybinds.kdl"
    "niri/cfg/layout.kdl:.config/niri/cfg/layout.kdl"
    "niri/cfg/misc.kdl:.config/niri/cfg/misc.kdl"
    "niri/cfg/rules.kdl:.config/niri/cfg/rules.kdl"

    # Noctalia (config manual + templates próprios + configurações da interface)
    "noctalia/config.toml:.config/noctalia/config.toml"
    "noctalia/templates/niri-extra.kdl:.config/noctalia/templates/niri-extra.kdl"
    "noctalia/templates/fzf-opts:.config/noctalia/templates/fzf-opts"
    "noctalia/templates/openbot.json:.config/noctalia/templates/openbot.json"
    "noctalia/templates/fluxer.css:.config/noctalia/templates/fluxer.css"
    "noctalia/templates/qtct.conf:.config/noctalia/templates/qtct.conf"
    "noctalia/templates/papirus/apply.sh:.config/noctalia/templates/papirus/apply.sh"
    "noctalia/templates/papirus/colors:.config/noctalia/templates/papirus/colors"
    "noctalia/templates/papirus/papirus-folders:.config/noctalia/templates/papirus/papirus-folders"
    "noctalia/settings.toml:.local/state/noctalia/settings.toml"

    # fish
    "fish/conf.d/noctalia-fzf.fish:.config/fish/conf.d/noctalia-fzf.fish"

    # Qt (tema via qt5ct/qt6ct com as cores do Noctalia)
    "qt/qt6ct.conf:.config/qt6ct/qt6ct.conf"
    "qt/qt5ct.conf:.config/qt5ct/qt5ct.conf"

    # Sessão: variáveis de ambiente e portais
    "session/environment.d/10-desktop.conf:.config/environment.d/10-desktop.conf"
    "session/xdg-desktop-portal/niri-portals.conf:.config/xdg-desktop-portal/niri-portals.conf"
    "session/xdg-desktop-portal/portals.conf:.config/xdg-desktop-portal/portals.conf"
)
