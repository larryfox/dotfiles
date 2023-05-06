function random64
    set -l num "33"

    if test (count $argv) -gt 0
        set num $argv[1]
    end

    set -l rand (openssl rand -base64 $num)
    echo -e $rand
    echo -e "$rand" | pbcopy
end
