function fish_title
  # Terminal.app handles this
end

function fish_prompt
    printf ' ❯ '
end

function fish_right_prompt
    printf '%s%s%s%s%s%s' (set_color blue) (prompt_pwd) \
      (set_color 666) (__fish_git_prompt) (___git_dirty) \
      (set_color normal)
end

function ___git_dirty
    set -l dirty

    command git diff-index --quiet --ignore-submodules HEAD ^/dev/null

    if test $status -eq 1
        printf '%s%s%s' (set_color red) " ✗" (set_color normal)
    end
end
