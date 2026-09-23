function (fn (status filename))
    # @summary: push fishmonger changes to git repo
    # @usage: fm.push "great additions!"
    
    argparse -us -- $argv
    set -f git_message "$(status function) commit"
    if [ -n "$argv[1]" ]
        set -f git_message "$argv[1]"
	set -e argv[1]
    end
    set -f C "$(path dirname (status filename))"
    begin
	git -C "$C" add ..	     
	git -C "$C" commit -am "$git_message"
	git -C "$C" log -n1 >&2
	git -C "$C" push
    end >&2
end