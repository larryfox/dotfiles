# Homebrew
set PATH /usr/local/sbin $PATH

# GNU core utilities without 'g' prefix (brew --prefix coreutils)
set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

# Go
set PATH $GOPATH/bin $PATH

# Local bins
set PATH $HOME/bin $PATH

# Git man pages
set MANPATH /usr/local/git/man $MANPATH

# Homebrew man pages
set MANPATH /usr/local/man $MANPATH
