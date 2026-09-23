function (fn (status filename)) -d "source all vendor_conf.d/*.fish files in fishmonger.root bottom up"
    argparse v/verbose\& -- $argv
    # for c in (path filter -r (fishmonger.root)/{market.d/*/vendor_conf.d/*.fish,vendor_conf.d/*.fish}); source $c; end
    for c in (path filter -r (fishmonger.root)/vendor_conf.d/*.fish); source $c; and set -q _flag_verbose; and echo $c >&2; end
end
