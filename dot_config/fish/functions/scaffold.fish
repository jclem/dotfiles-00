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
        set argv $argv[2..]
        argparse D/debug h/help -- $argv
        or return

        if set -q _flag_help
            echo """Usage: $_ run <options...>

Options:
-D, --debug  run in debug mode
-h, --help   display this help message"""
            return 0
        end
    end
end
