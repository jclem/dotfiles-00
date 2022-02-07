function ns
    if ! test -f package.json
        return 1
    end


    set script (cat package.json | jq -r '.scripts | keys[]' | fzf --preview="cat package.json | jq -r '.scripts .{}'" --preview-window=top,1)

    if [ -z "$script" ]
        return 1
    end

    npm run $script $argv
end
