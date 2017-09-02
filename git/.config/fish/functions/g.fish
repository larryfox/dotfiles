function g --wraps git
    if test (count $argv) -gt 0
        git $argv
    else
        git status -sb
    end
end
