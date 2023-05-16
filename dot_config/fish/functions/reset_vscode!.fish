function reset_vscode!
    echo '[]' >"$HOME/Library/Application Support/Code/User/keybindings.json"
    echo '{}' >"$HOME/Library/Application Support/Code/User/settings.json"
    for ext in (code --list-extensions)
        code --uninstall-extension $ext --force
    end

    echo '[]' >"$HOME/Library/Application Support/Code - Insiders/User/keybindings.json"
    echo '{}' >"$HOME/Library/Application Support/Code - Insiders/User/settings.json"
    for ext in (code-insiders --list-extensions)
        code-insiders --uninstall-extension $ext --force
    end
end
