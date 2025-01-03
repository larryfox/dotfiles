source ~/.asdf/asdf.fish

if not test -L ~/.config/fish/completions/asdf.fish
    mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end

