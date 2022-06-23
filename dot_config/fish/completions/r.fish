complete --command r \
    --condition '__fish_is_nth_token 1' \
    --arguments '(__r_user_completion)' \
    --no-files

# Return a list of users from $CODE for `r <user>`
function __r_user_completion
    ls -L "$CODE"
end

complete --command r \
    --condition '__fish_is_nth_token 2' \
    --arguments '(__r_repo_completion)' \
    --no-files

# Return a list of repositories for `r user <repo>`
function __r_repo_completion
    set user (commandline --tokenize)[2]
    ls -L "$CODE/$user"
end
