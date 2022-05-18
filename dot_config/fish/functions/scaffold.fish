function scaffold
    argparse -s h/help -- $argv
    or return

    if set -q _flag_help
        echo """Usage: $_ <options...> <command>

Options:
-h, --help  display this help message
    
Commands:
run         run a command"""
        return 0
    end

    if test $argv[1] = run
        scaffold_run $argv[2..]
    end

    if test $argv[1] = ls
        scaffold_ls $argv[2..]
    end
end

function scaffold_run
    argparse -s -N1 D/debug h/help -- $argv
    or return

    if set -q _flag_help
        echo """Usage: $_ run <options...>

Options:
-D, --debug  run in debug mode
-h, --help   display this help message"""
        return 0
    end

    for scaffold in $argv
        set -l run_path (__scaffold_run_path $scaffold)

        if ! test -f $run_path
            set_color red
            echo "No scaffold found: $scaffold"
            set_color normal
            return 1
        end
    end

    for scaffold in $argv
        set -l run_path (__scaffold_run_path $scaffold)

        set_color blue
        set -l msg "Running scaffold $scaffold"
        echo $msg
        string repeat -n (string length $msg) -
        set_color normal

        if set -q _flag_debug
            set -l tmpdir (mktemp -d)
            set -l pipe "$tmpdir/indent"
            set_color -d grey
            mkfifo "$pipe"
            echo '|'
            fish -c "sed 's/^/|  /' <$pipe" &
            bash -x "$run_path" 2>$pipe
            wait
            echo '|'
            set_color normal
        else
            "$run_path"
        end

        set_color green
        echo "|  Scaffold $scaffold finished."

        if ! test $scaffold = $argv[-1]
            echo
        end
        set_color normal
    end
end

function scaffold_ls
    argparse -s -N0 -X0 h/help -- $argv
    or return

    if set -q _flag_help
        echo """Usage: $_ ls

Options:
-h, --help   display this help message"""
        return 0
    end

    set -l runners $SCAFFOLDS_DIR/**/run.sh

    for runner in $runners
        echo (string join / (string split / (dirname $runner))[-2..])
    end
end

function __scaffold_run_path
    echo -n "$SCAFFOLDS_DIR/$argv[1]/run.sh"
end
