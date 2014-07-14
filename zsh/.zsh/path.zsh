# path.zsh
typeset -aU path
typeset -aU manpath

# Homebrew
path=( /usr/local/bin /usr/local/sbin $path )

# GNU core utilities without 'g' prefix
path=( $(brew --prefix coreutils)/libexec/gnubin $path )

# Go
path=( $GOPATH/bin $path )

# Cabal
path=( $HOME/.cabal/bin $path )

# Local bins
path=( $HOME/bin $path )

# Postgres.app
path=( /Applications/Postgres.app/Contents/MacOS/bin/bin $path )

# Homebrew man pages
manpath=(/usr/local/man /usr/local/git/man $manpath)
