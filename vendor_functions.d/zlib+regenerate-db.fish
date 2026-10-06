function (fn (status filename)) -d "$(fn (status filename)) -a duration_days ## update '$(zlib+db)' if older than \$duration_days days old, default 7"
    # always regenerate (zlib+db) with `zlib+regenerate-db 0`

    set -f db "$(zlib+db)"
    # skip regeneration if no db readable
    [ -r "$db" ]; or return 0

    # duration_days
    if [ -n "$argv[1]" ]
        set -f duration_days $argv[1]
	set -e argv[1]
    else
        set -f duration_days 7
    end

    # is the duration since the last db update more than $duration_days?
    set -f duration (math (date +%s) - (path mtime "$db"))
    set -f duration_seconds (math 60 x 60 x 24 x $duration_days)
    if [ $duration -gt $duration_seconds ]
       # yes, update (zlib+db) using updatedb
       begin
	 echo "regenerating $db in the background..."
	 sudo updatedb --require-visibility=yes --add-prunenames='2sort 2sort-manually .attic' --output="$db" --database-root="$(path dirname $db)"
	 sudo chown $USER:$USER "$db"
       end >&2 &
    else
       # no, skip
       echo "$(status function) '$db' unneccessary, skipping" >&2
       return 0
    end
end