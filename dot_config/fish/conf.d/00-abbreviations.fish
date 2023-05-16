# See: https://fishshell.com/docs/current/commands.html#abbr

if status --is-interactive
    abbr --add --global bs brew services
    abbr --add --global co cobble
    abbr --add --global code code-insiders
    abbr --add --global cz chezmoi
    abbr --add --global dc docker-compose
    abbr --add --global dk docker
    abbr --add --global g git
    abbr --add --global k konk
    abbr --add --global ls exa
    abbr --add --global tf terraform
    abbr --add --global v vercel
end
