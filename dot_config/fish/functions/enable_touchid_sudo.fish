function enable_touchid_sudo
    set pamfile /etc/pam.d/sudo
    set firstline "# sudo: auth account password session"

    if ! test (uname) = Darwin
        set_color red
        echo "This script is only for macOS"
        set_color normal
        return 1
    end

    # Check for TouchID.
    if ! ls /usr/lib/pam | grep -q pam_tid.so
        set_color red
        echo "TouchID not found."
        set_color normal
        return 1
    end

    # Check if already enabled.
    if grep -q pam_tid.so "$pamfile"
        set_color green
        echo "TouchID already enabled for sudo"
        set_color normal
        return 0
    end

    # Verify pamfile format.
    if ! head -n1 "$pamfile" | grep -q "$firstline"
        set_color red
        echo "$pamfile in unexpected format"
        set_color normal
        return 1
    end

    set bk (mktemp)
    cp "$pamfile" "$bk"

    set_color blue
    echo "Backing up $pamfile to $bk"
    set_color normal

    # Enable TouchID for sudo.
    sudo sed -i .bak '2i\
auth sufficient pam_tid.so\
' "$pamfile"

    set_color green
    echo "TouchID enabled for sudo"
    set_color normal
end
