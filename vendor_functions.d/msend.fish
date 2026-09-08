function (fname (status filename)) -a cmd subcmd
    # msend --show --select=n $cmd $subcmd $args[3..]
    # Dispatch to $cmd $subcmd [$subsubcmd], default `msend+receivers()`.
    # set -s (status function) cmd subcmd argv >&2
    set -l cmd (value $cmd (status function))
    set -l subcmd (value $subcmd receivers)
    set -e argv[1..2]
    # set -s (status function) cmd subcmd argv >&2

    # FUTURE carif: msend --select=3 $receiver --option0 $subcmd --option1 $subsubcmd $rest 
    argparse -us -- "$argv"
    set -l argv_opts0 $argv_opts

    # set -q _flag_show; and set -s argv_opts0 cmd subcmd argv >&2
    if [ $subcmd = receivers ]
        set -l _cmd=(rcvr4 (status function) receivers); and $_cmd $argv_opts0 $cmd $argv
    else if functions -q (rcvr4 $cmd $subcmd)
        set -l _cmd (rcvr4 $cmd $subcmd); and $_cmd $argv_opts0 $argv
    else if builtin -q $cmd
         builtin $cmd $argv_opts0 $subcmd $argv
    else if command -q $cmd
        _cmd=(command -s $cmd) command $_cmd $argv_opts0 $subcmd $argv
    else
        echo "$(status function): cannot '$(status function) $cmd $subcmd $argv'" >&2
        return 1
    end
end
