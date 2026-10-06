# function (rcvrf (status filename) --db=db:pathname) --no-scope-shadowing
function (fn (status filename)) -d "$(fn (status filename)) \$author [\$category] |> all docs matching \$author and optional \$category"
    set -f author (value "$argv[1].*" '[^-]+' )
    set -f category (value "$argv[2].*" '[^.]+' )
    locate --database="$(zlib+db)" --regex -- "-$author-[[:digit:]]{4}\.$category\."
end

