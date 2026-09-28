function (fn (status filename))
    argparse -us -- $argv
    if [ -z "$argv[1]" ]
        echo "$(status function): missing cmd?"
	return 1
    else
       set -f wrapper "$argv[1]"
       set -f cmd (path basename -E "$wrapper")
       set -e argv[1]
    end >&2
        printf '
function %s -w %s
    argparse -us -- $argv
    cmd=(status function) command $cmd $argv_opts $argv
end
' $cmd $cmd $cmd
end
