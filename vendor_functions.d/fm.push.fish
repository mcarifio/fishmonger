function (fn (status filename))
    argparse -us -- $argv
    set -f git_message "$(status function) commit"
    if [ -n "$argv[1]" ]
        set -f git_message "$argv[1]"
	set -e argv[1]
    end
    set -f C "$(path dirname (status filename))"
    git -C "$C" add ..
    git -C "$C" commit -am "$git_message"
    git -C "$C" push
end