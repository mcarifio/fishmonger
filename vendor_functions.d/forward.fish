function forward -a cmd
    set -l _cmd (command -sa $cmd)
    if [ (count $_cmd) -gt 1 ]
        $_cmd[2] $argv
    else
        echo "No fowarding command for `$_cmd`" >&2
        return 1
    end
end
