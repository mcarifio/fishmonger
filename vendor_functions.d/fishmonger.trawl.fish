function (fn (status filename)) -d "source all vendor_conf.d/*.fish files in fishmonger.root bottom up"
    for c in (path filter -r (fishmonger.root)/{market.d/*/vendor_conf.d/*.fish,vendor_conf.d/*.fish}); source $c; end
end