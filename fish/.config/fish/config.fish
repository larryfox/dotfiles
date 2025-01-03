set CDPATH . $HOME/Code $CDPATH

set -gx EDITOR "nvim"
set -gx VISUAL $EDITOR

bind \cf tmux-sessionizer
bind \cv "nvim ."

function search_history
    commandline \
        (history | fzf --height=15 --reverse --scheme=history --prompt="history: ")
    commandline -f repaint
end
bind \cr search_history

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/fox/.ghcup/bin # ghcup-env