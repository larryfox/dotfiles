# chruby
source /usr/local/share/chruby/chruby.sh

# gem_home
source /usr/local/share/gem_home/gem_home.sh

function chrb {
    chruby $1 && gem_home .
}
