function find_repo
    env PAGER=cat gh repo list $argv |
        cut -f1 |
        fzf \
            --preview="socat - EXEC:'gh repo view {}',pty,setsid,ctty" \
            --preview-window=75% \
            --bind="page-down:preview-half-page-down,page-up:preview-half-page-up"
end
