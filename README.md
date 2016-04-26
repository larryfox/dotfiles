# .dotfiles

1. Clone this repo into `$HOME`
2. Install the `Brewfile` 

    ~~~ bash
    $ brew tap homebrew/bundle && brew bundle
    ~~~
    
3. Stow the individual components as needed

    ~~~ bash
    $ stow {zsh,git,ruby,go,textmate}
    ~~~


#### Setting zsh as the login shell
1. Append `/usr/local/bin/zsh` to `/etc/shells`
2. `chsh -s /usr/local/bin/zsh`
