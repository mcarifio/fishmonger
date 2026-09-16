# is emacsclient actually installed?
set -l _cmd (path basename --no-extension (status basename)) 
type -q $_cmd || fish_command_not_found $_cmd

function emacsclient -w emacsclient -d "augments emacsclient with initial flags"
    # setting alternate-editor to null string defaults to `emacs --daemon` first and then connecting to that emacs server
    _cmd=(status function) command $_cmd --alternate-editor= --reuse-frame --no-wait --timeout=20 --quiet $argv
end
