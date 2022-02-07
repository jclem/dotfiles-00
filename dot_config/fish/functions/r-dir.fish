# Get the code directory of a GitHub repository.
function r-dir
    argparse --name=r-dir h/help -- $argv

    if set -q _flag_h
        or test (count $argv) -lt 1
        echo "\
Usage: r-dir <owner> [<repo>]
Get the code directory of a GitHub repository. Does not check for existence
of the directory.
Options
    -h/--help    Print this help message"

        return 0
    end

    if test (count $argv) -eq 1
        echo "$CODE/$argv[1]"
        return 0
    end

    set -l repo "$argv[1]/$argv[2]"
    echo "$CODE/$repo"
end
