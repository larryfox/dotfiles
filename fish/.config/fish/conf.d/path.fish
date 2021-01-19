# BREW
set -gx HOMEBREW_PREFIX "/opt/homebrew"
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar"
set -gx HOMEBREW_REPOSITORY "/opt/homebrew"
set -gx MANPATH "/opt/homebrew/share/man" $MANPATH
set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH

contains /opt/homebrew/bin $fish_user_paths; or set -Up fish_user_paths /opt/homebrew/bin
contains /opt/homebrew/sbin $fish_user_paths; or set -Up fish_user_paths /opt/homebrew/sbin

# GNU core utilities without 'g' prefix (brew --prefix coreutils)
contains /opt/homebrew/opt/coreutils/libexec/gnubin $fish_user_paths; or set -Up fish_user_paths /opt/homebrew/opt/coreutils/libexec/gnubin
set -gxp MANPATH /opt/homebrew/opt/coreutils/libexec/gnuman

# sqlite
# set -U fish_user_paths /usr/local/opt/sqlite/bin $fish_user_paths

# mysql
# set -U fish_user_paths /usr/local/opt/mysql-client/bin $fish_user_paths

# Go
# set fish_user_paths $GOPATH/bin $fish_user_paths

# Local bins
contains $HOME/bin $fish_user_paths; or set -Up fish_user_paths $HOME/bin

# Node
contains $HOME/.nvm/current/bin $fish_user_paths; or set -Up fish_user_paths $HOME/.nvm/current/bin
