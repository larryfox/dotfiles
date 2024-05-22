set CDPATH . $HOME/Code $CDPATH

set -gx EDITOR "nvim"
set -gx VISUAL $EDITOR

bind \cf tmux-sessionizer

function search_history
    commandline \
        (history | fzf --height=15 --reverse --scheme=history --prompt="history: ")
    commandline -f repaint
end
bind \cr search_history
