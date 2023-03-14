function github_goproxy
    set -gx GOPROXY "https://goproxy.githubapp.com/mod,https://proxy.golang.org/,direct"
    set -gx GOPRIVATE ""
    set -gx GONOPROXY ""
    set -gx GONOSUMDB "github.com/github/*"
end
