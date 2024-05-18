set -gx HOMEBREW_PREFIX "/opt/homebrew"
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar"
set -gx HOMEBREW_REPOSITORY "/opt/homebrew"
set -gxp MANPATH "/opt/homebrew/share/man"
set -gxp INFOPATH "/opt/homebrew/share/info"

fish_add_path --append /opt/homebrew/bin
fish_add_path --append /opt/homebrew/sbin
fish_add_path $HOME/.platform-bin
fish_add_path $HOME/.local/bin

# GNU core utilities without 'g' prefix
fish_add_path --append (brew --prefix coreutils)/libexec/gnubin
set -gxp MANPATH (brew --prefix coreutils)/libexec/gnuman
