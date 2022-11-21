function mann
    argparse --name=mann h/help P/pdf H/html T/term -- $argv

    if set -q _flag_help
        or test (count $argv) -lt 1
        echo "\
Usage: mann <comman> [<option>]
Display a man page in PDF, HTML, or Terminal.
Options
    --help    Print this help message
    -p/--pdf  Open as a PDF
    -h/--html Open an HTML page (will start a server)
    -t/--term Open in Terminal.app"

        return 0
    end

    echo $argv

    if set -q _flag_pdf
        mandoc -T pdf "$(/usr/bin/man -w $argv)" | open -fa Preview
        return 0
    end

    if set -q _flag_html
        set dir (mktemp -d)
        set file "$dir/$argv.html"
        mandoc -T html -O style="/usr/share/misc/mandoc.css" "$(/usr/bin/man -w $argv)" >"$file"
        open "$file"
        return 0
    end

    open "x-man-page://$argv"
    return 0
end
