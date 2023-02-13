if test (uname) = Darwin
    set -x PATH $PATH /opt/homebrew/bin "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
end

if test (uname) = Linux
    set -x PATH $PATH "$HOME/.local/bin"
end

set -x PATH $PATH "$HOME/bin"

if type -q go
    set -x PATH $PATH (go env GOPATH)/bin
end

# Add Rust toolchain to PATH
if test -d "$HOME/.cargo/bin"
    set -x PATH $PATH "$HOME/.cargo/bin"
end

# Add python un-versioned binaries (pip vs pip3) to PATH
if type -q brew && test -d (brew --prefix)/opt/python/libexec/bin
    set -x PATH $PATH (brew --prefix)/opt/python/libexec/bin
end
