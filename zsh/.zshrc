ZSH="$HOME/.zsh"
PROJECTS="$HOME/Code"

[[ -a $HOME/.localrc ]] && source $HOME/.localrc

fpath=($ZSH/functions $fpath)
autoload -U $ZSH/functions/*(:t)

for file in `find $ZSH -maxdepth 2 -name \*.zsh`
do
  source $file
done

attach_to_tmux

# brew install zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export MANPATH
export PATH
