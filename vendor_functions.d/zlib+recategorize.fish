function (fn (status filename))
    # argparse -us -- $argv
    set -q argv[1]; or begin; echo "$(status function): missing category?"; return 1; end >&2
    set -f cat $argv[1]; set -e argv[1]
    for f in $argv; rename -n "s/\.[^.]+(\.[^.]+)\$/.$cat\$1/" $f; end
end
