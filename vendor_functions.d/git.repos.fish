function (fn (status filename))
    argparse -us -- $argv
    set -f top "$PWD"
    if [ -n "$argv[1]" ]
        set -f top "$argv[1]"
	set -e argv[1]
    end
    [ -d "$top" ]; or begin set -l _status $status; echo "$(status function): '$top' is not a directory" >&2; return $_status; end
    # set -s argv_opts argv top >&2
    # set -l fish_trace 1
    for g in (path filter -d $top/**/.git)
        printf '%s\t%s\n' (path dirname "$g") (git -C "$g" $argv_opts remote get-url origin)
    end
end