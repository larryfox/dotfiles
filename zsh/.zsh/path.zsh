# path.zsh
typeset -aU path
typeset -aU manpath

# Homebrew
path=( /usr/local/bin /usr/local/sbin $path )

# GNU core utilities without 'g' prefix
path=( $(brew --prefix coreutils)/libexec/gnubin $path )
manpath=( $(brew --prefix coreutils)/libexec/gnuman $manpath )

# Go
[ -n "$GOPATH" ] && path=( $GOPATH/bin $path )

# Local bins
path=( $HOME/bin $path )

# Homebrew man pages
manpath=( /usr/local/man /usr/local/git/man $manpath )
