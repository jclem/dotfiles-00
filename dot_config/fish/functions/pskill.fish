function pskill
    ps -ef | fzf | awk '{print $2}' | xargs kill -9
end
