# BREW
set -gx HOMEBREW_PREFIX "/opt/homebrew"
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar"
set -gx HOMEBREW_REPOSITORY "/opt/homebrew"
set -gxp MANPATH "/opt/homebrew/share/man"
set -gxp INFOPATH "/opt/homebrew/share/info"

fish_add_path $HOME/.local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# GNU core utilities without 'g' prefix (brew --prefix coreutils)
fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin
set -gxp MANPATH /opt/homebrew/opt/coreutils/libexec/gnuman

fish_add_path $GOPATH/bin
fish_add_path $HOME/.cargo/bin
