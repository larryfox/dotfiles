# keybinds.zsh

# vim mode
bindkey -v

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# bck-i-search
bindkey -M viins "^r" history-incremental-search-backward
bindkey -M vicmd "f" history-incremental-search-backward
