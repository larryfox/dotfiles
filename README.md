# dotfiles

1. Clone this repo into `$HOME`
2. Install the `Brewfile`

    ~~~ bash
    $ brew bundle --no-lock
    ~~~

3. Stow the individual components as needed

    ~~~ bash
    $ stow {fish,git,ruby,go}
    ~~~


#### Setting fish as the login shell
1. `$ echo $(brew --prefix fish) >> /etc/shells`
2. `$ chsh -s $(brew --prefix fish)`
