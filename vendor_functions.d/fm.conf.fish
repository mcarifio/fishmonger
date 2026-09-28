function (fn (status filename))
    argparse -us -- "$argv"
    if [ -z "argv[1]" ]
        echo "$(status function): pathname missing?"
	return 1
    end >&2
    set -f pn "$argv[1]"; set -e argv
    set -f conf (path resolve "$pn/../../vendor_conf.d/$(path basename $pn)")
    source $conf
end