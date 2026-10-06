function (fn (status filename))
    set -f db "$(zlib+root)/e.locate.db"
    [ -r "$db" ]; and echo $db; or begin; echo "$db not readable"; return 1; end >&2
end