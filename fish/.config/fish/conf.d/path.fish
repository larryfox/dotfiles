# GNU core utilities without 'g' prefix (brew --prefix coreutils)
set -U fish_user_paths /usr/local/opt/coreutils/libexec/gnubin $fish_user_paths
set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

# sqlite
set -U fish_user_paths /usr/local/opt/sqlite/bin $fish_user_paths

# Go
set fish_user_paths $GOPATH/bin $fish_user_paths

# Local bins
set fish_user_paths $HOME/bin $fish_user_paths

