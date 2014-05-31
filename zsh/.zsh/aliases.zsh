# aliases.zsh

alias q="vim ~/.zshrc"
alias qq="source ~/.zshrc"
alias ql="vim ~/.localrc"

# verbose/interactive
alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"

# make pgrep more useful (long output & case insensitive match against full process path)
alias pgrep="pgrep -lfi"

# colorize
alias ls="ls --color"
alias l="ls -AGFlh"

# Use modern regexps for sed, i.e. "(one|two)", not "\(one\|two\)"
alias sed="sed -E"

# correctly interpret ASCII color escapes
alias less="less -R"

alias prettyjson="python -m json.tool"

# Enable aliases to be sudo’ed
alias sudo="sudo "

# Gzip-enabled `curl`
alias gurl="curl --compressed"

# list all programs
alias which="which -a"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done
