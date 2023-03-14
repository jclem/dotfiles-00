function reload
    argparse --name=reload a/apply h/help -- $argv

    if set -q _flag_h
        echo "Usage: reload [-a]"
        echo "Reloads the shell with the latest dotfiles."
        echo "  -a, --apply  Apply the dotfiles instead of updating them."
        return
    end

    if set -q _flag_a
        chezmoi apply
    else
        chezmoi update
    end

    exec fish
end
