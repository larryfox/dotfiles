function fish_title
  # Terminal.app handles this
end

# Remove greeting
set fish_greeting

# Turn on git prompt features
set __fish_git_prompt_char_stateseparator " "
set __fish_git_prompt_showdirtystate
set __fish_git_prompt_char_dirtystate "✗"
set __fish_git_prompt_color_dirtystate --bold red
set __fish_git_prompt_char_stagedstate "±"
set __fish_git_prompt_color_stagedstate --bold green
set __fish_git_prompt_color_branch --bold green

function fish_prompt
    set -l last_status $status

    echo -n $USER@$hostname
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    echo -n (fish_git_prompt)

    if not test $last_status -eq 0
        set_color $fish_color_error
    end
    echo -n " ❯ "
    set_color normal
end
