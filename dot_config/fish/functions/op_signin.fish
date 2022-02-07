function op_signin
    if set -q OP_SESSION_my
        return 0
    end

    set -gx OP_SESSION_my (op signin --output=raw)
end
