function github_token
    # Sign in to 1Password
    op_signin

    set op_token_uuid ymn4wu2ugfahzaziw4h5naqkyy
    op get item $op_token_uuid | jq -r '.details.password'
end
