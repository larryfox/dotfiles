# .dotfiles

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
1. Append `/usr/local/bin/fish` to `/etc/shells`
2. `chsh -s /usr/local/bin/fish`

