function portblame
    sudo lsof -i -P | grep LISTEN | grep :$argv[1]
end
