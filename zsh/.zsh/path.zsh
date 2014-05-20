# path.zsh

# Homebrew
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# GNU core utilities without 'g' prefix
PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Local bins
PATH="$HOME/bin:$PATH"

# Postgres.app
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Homebrew man pages
MANPATH="/usr/local/man:/usr/local/git/man:$MANPATH"
