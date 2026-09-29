# function (rcvr --def zlib category2fqpn) -a category
function (fn (status filename)) -a category
    [ -n "$category" ]; or return (ret "category '$category' missing?")
    set -l root (value $argv[2] (zlib+root))
    # TODO: exclude *sort and current
    set -l paths (find $root -type d -name $category)
    echo $paths[1]
end
