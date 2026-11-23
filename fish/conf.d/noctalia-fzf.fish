# Cores do fzf geradas pelo Noctalia a partir do wallpaper.
# O fzf lê este arquivo a cada execução, então troca de wallpaper vale na hora.
if test -f $HOME/.config/fzf/noctalia-opts
    set -gx FZF_DEFAULT_OPTS_FILE $HOME/.config/fzf/noctalia-opts
end
