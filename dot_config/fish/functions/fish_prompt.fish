function fish_prompt
    set -l last_status $status
    set_color green
    printf (prompt_pwd)
    if test $last_status != 0
        set_color red
    end
    printf ' → '
end
