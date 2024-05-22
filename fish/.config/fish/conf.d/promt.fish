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
# set __fish_git_prompt_color --bold 666

function fish_prompt
  string join "" -- \
    (set_color $fish_color_cwd) \
    (path basename (prompt_pwd)) \
    (set_color normal) \
    (fish_git_prompt) " ❯ "
end
