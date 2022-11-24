set -x CODE "$HOME/src/github.com"
set -x EDITOR "code --wait"
set -x ERL_AFLAGS "-kernel shell_history enabled -kernel shell_history_file_bytes 2097152"
set -x GPG_TTY (tty)
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x __fish_git_prompt_showcolorhints true
set -x __fish_git_prompt_use_informative_chars true
set -x __fish_git_prompt_color brblack
set -x __fish_git_prompt_color_prefix brblack
set -x __fish_git_prompt_color_suffix brblack
set -x __fish_git_prompt_char_stateseparator ' → '
set -x async_prompt_functions fish_right_prompt
set -x fisher_path "$__fish_config_dir/fisher"
