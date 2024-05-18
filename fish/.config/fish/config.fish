set CDPATH . $HOME/Code $CDPATH

set -gx EDITOR "nvim"
set -gx VISUAL $EDITOR

# Don’t clear the screen after quitting a manual page
set MANPAGER "less -X"

bind \cf tmux-sessionizer
