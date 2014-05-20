compdef g=git

function g {
    if [[ $# > 0 ]]; then
        git "$@"
    else
        git status -sb
    fi
}
