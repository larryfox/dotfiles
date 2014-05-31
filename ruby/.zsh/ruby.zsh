# Bundler
alias bi="bundle install"
alias bu="bundle update"
alias be="bundle exec"

# Rails
alias rls="rails"

# chruby
source /usr/local/share/chruby/chruby.sh

# chruby with auto-switching
# source /usr/local/share/chruby/auto.sh

function chrb {
    chruby $1 && chgems
}
