# prompt.zsh

# Modified from Pure & gabebw's prompt
# github.com/sindresorhus/pure
# github.com/gabebw/dotfiles

# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

autoload -Uz vcs_info

# run before setting $PS1 each time
function precmd { vcs_info 'prompt'; }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats " %b"
zstyle ':vcs_info:git*' actionformats " %b|%a"

# Must use print (not echo) for ZSH colors to work
function git_branch {
  [[ "$vcs_info_msg_0_" != '' ]] && print "%F{242}${vcs_info_msg_0_}$(git_dirty)%f"
}

function git_dirty {
  command git diff --quiet --ignore-submodules HEAD &>/dev/null
  (($? == 1)) && echo ' ✗'
}

# prevent percentage showing up
# if output doesn't end with a newline
export PROMPT_EOL_MARK=''

# prompt turns red if the previous command didn't exit with 0
directory="%F{blue}%~%f"
export PROMPT="
%(?.%F{magenta}.%F{red})❯%f "

export RPROMPT="$directory\$(git_branch)" 
