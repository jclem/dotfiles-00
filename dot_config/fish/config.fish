set -x fish_greeting
fish_vi_key_bindings

if [ (uname) != Darwin ]
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if type -q brew; and test -d (brew --prefix asdf)
    if test -f (brew --prefix asdf)/libexec/asdf.fish
        source (brew --prefix asdf)/libexec/asdf.fish
    end
end

if type -q fzf_configure_bindings
    fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs
end

if test -f $XDG_CONFIG_HOME/op/plugins.sh
    source $XDG_CONFIG_HOME/op/plugins.sh
end
