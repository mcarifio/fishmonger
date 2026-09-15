for f in (path resolve (status filename)/..)/*.fish
    [ "$f" != (status filename) ]; and source $f
end
