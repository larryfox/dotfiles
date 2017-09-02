HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# enable multiple shells to share a common history
setopt inc_append_history
setopt share_history

# add timestamps to history
setopt extended_history

autoload -Uz promptinit
promptinit
prompt walters

# chruby
source /usr/local/share/chruby/chruby.sh

# gem_home
source /usr/local/share/gem_home/gem_home.sh

function chrb {
    chruby $1 && gem_home .
}

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
