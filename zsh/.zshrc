ZSH="$HOME/.zsh"
PROJECTS="$HOME/Code"

[[ -a $HOME/.localrc ]] && source $HOME/.localrc

fpath=($ZSH/functions $fpath)
autoload -U $ZSH/functions/*(:t)

for file in `find $ZSH -maxdepth 2 -name \*.zsh`
do
  source $file
done

# brew install zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export MANPATH
export PATH

# OPAM configuration
. /Users/fox/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config env`
