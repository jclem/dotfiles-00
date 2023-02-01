function envsource
    for line in (cat $argv | grep -v '^#' | grep -v '^\s*$')
        set item (string split -m1 '=' $line)
        set key $item[1]
        set value (string trim -c\'\" $item[2])
        set -gx $key $value
        echo "Exported $key"
    end
end
