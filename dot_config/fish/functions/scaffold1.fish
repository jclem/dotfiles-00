function scaffold1
    argparse -s h/help -- $argv
    or return

    if set -q _flag_help
        __scaffold_help
        return 0
    end

    if test $argv[1] = run
        scaffold_run $argv[2..]
        return $status
    end

    if test $argv[1] = ls
        scaffold_ls $argv[2..]
        return $status
    end

    if test $argv[1] = help
        scaffold_help $argv[2..]
        return $status
    end
end

function scaffold_help
    argparse -s D/debug h/help -- $argv
    or return

    set -l cmd $argv[1]

    switch $cmd
        case ""
            __scaffold_help
        case help
            __scaffold_help_help
        case run
            __scaffold_run_help
        case ls
            __scaffold_ls_help
    end
end

function scaffold_run
    argparse -s D/debug h/help -- $argv
    or return

    if set -q _flag_help
        __scaffold_run_help
        return 0
    end

    for scaffold in $argv
        if string match -q '*/' $scaffold
            continue
        end

        set -l run_path (__scaffold_run_path $scaffold)

        if ! test -f $run_path
            set_color red
            echo "No scaffold found: $scaffold"
            set_color normal
            return 1
        end
    end

    set -l any_failure 0

    for scaffold in $argv
        if string match -q '*/' $scaffold
            set -l scaffolds (eval "ls $SCAFFOLDS_DIR/$scaffold""**/run.sh")
            for scaffold in $scaffolds
                __scaffold_run (__scaffold_name_from_run_path $scaffold) $scaffolds

                if test $status -ne 0
                    set any_failure 1
                end
            end

            continue
        end

        __scaffold_run $scaffold $argv
        if test $status -ne 0
            set any_failure 1
        end
    end

    if test $any_failure -eq 1
        return 1
    end
end

function __scaffold_run -S -a scaffold
    set -l run_path (__scaffold_run_path $scaffold)
    set_color normal

    set_color blue
    echo "#  $scaffold"
    set_color normal

    set -f exit_code

    set_color grey
    if set -q _flag_debug
        bash -x "$run_path" 2>&1 | sed 's/^/|  /'
        set exit_code $pipestatus[1]
    else
        "$run_path" 2>&1 | sed 's/^/|  /'
        set exit_code $pipestatus[1]
    end
    set_color normal

    if test $exit_code -eq 0
        set_color green
        echo "#  $scaffold OK"
    else
        set_color red
        echo "#  $scaffold FAIL"
    end

    return $exit_code
end

function scaffold_ls
    argparse -s -N0 -X0 h/help -- $argv
    or return

    if set -q _flag_help
        __scaffold_ls_help
        return 0
    end

    set -l runners $SCAFFOLDS_DIR/**/run.sh

    for runner in $runners
        echo (__scaffold_name_from_run_path $runner)
    end
end

function __scaffold_help
    echo """Usage: $_ [command]

Run scaffolding scripts to speed up project creation and configuration.

Options:
-h, --help  display this help message
    
Commands:
run         run a scaffold or scaffolds
ls          list available scaffolds
help        display help for a command"""
end

function __scaffold_help_help
    echo """Usage: $_ help [command]

Print help for the given scaffold subcommand.

Options:
-h, --help  display this help message"""
end

function __scaffold_run_help
    echo """Usage: $_ run <options...> <scaffolds...>

Run one or more scaffold scripts.

The scaffold tool will look in \$SCAFFOLDS_DIR for scaffold scripts. A scaffold
can be run by name:

    scaffold run javascript/prettier javascript/vscode

...or by prefix:

    scaffold run javascript/

Note the trailing slash.

Options:
-D, --debug  run in debug mode
-h, --help   display this help message"""
end

function __scaffold_ls_help
    echo """Usage: $_ ls

List the available scaffolds to run.

Options:
-h, --help   display this help message"""
end

function __scaffold_name_from_run_path -a path
    echo -n (string join / (string split / (dirname $path))[-2..])
end

function __scaffold_run_path
    echo -n "$SCAFFOLDS_DIR/$argv[1]/run.sh"
end
