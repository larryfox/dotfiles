# options.zsh

# correct command spelling
setopt correct

# correct command argument spelling
# setopt correct_all

# Always push the current directory onto dirs stack; hop back with popd
setopt auto_pushd

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# enable multiple shells to share a common history
setopt inc_append_history

# Those who repeat history are doomed to have a lot of useless history entries
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

# add timestamps to history
setopt extended_history

# Allow [ or ] wherever you want
unsetopt nomatch

# cd into a directory if it isn't a command
setopt auto_cd

# append slashes to completed directory names
setopt auto_param_slash

# enable extended globbing
setopt extended_glob

# allow commands in prompt
setopt prompt_subst
setopt prompt_percent
setopt prompt_cr

# quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
