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
    (set_color normal) " ❯ "
end

function fish_right_prompt
  set -l last_status $status
  set -l stat
  if test $last_status -ne 0
    set stat (set_color red)"[$last_status]"(set_color normal)
  else
    set stat (set_color green)"[$last_status]"(set_color normal)
  end
  set -l curtime (set_color brgrey)(date "+%R")(set_color normal)

  string join " " -- (fish_git_prompt) $curtime $stat
end
