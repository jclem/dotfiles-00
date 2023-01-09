set -x fish_greeting
fish_vi_key_bindings

if [ (uname) != Darwin ]
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if type -q brew; and test -d (brew --prefix asdf)
    if test -f (brew --prefix asdf)/share/fish/asdf.fish
        source (brew --prefix asdf)/share/fish/asdf.fish
    end

    for file in (brew --prefix asdf)/share/fish/*.d/*.fish
        source $file
    end
end

if type -q fzf_configure_bindings
    fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs
end
