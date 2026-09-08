function forward -a cmd
    set -l _cmd (command -sa (builtin path basename $cmd))
    if [ (count $_cmd) -gt 1 ]
        echo $_cmd[2]
    else
        echo "No fowarding command for `$_cmd`" >&2
        return 1
    end
end
