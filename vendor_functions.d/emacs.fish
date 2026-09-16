# is emacs actually installed?
status is-interactive; or return 0
set -l cmd (path basename --no-extension (status basename)) 
command -q $cmd; or fish_command_not_found $cmd

# is an emacs service available to run in the background?
if status is-login && systemctl --user list-unit-files emacs.service --no-legend --no-pager &> /dev/null and not systemctl --user is-active emacs
    loginctl enable-linger $USER
    systemctl --user enable --now emacs
end

function emacs --wraps emacs
    # argparse ...
    _cmd=(status function) command $_cmd $argv &
end
