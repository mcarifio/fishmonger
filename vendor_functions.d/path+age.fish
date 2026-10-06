function (fn (status filename)) -d "$(fn (status filename)) |> age of pathname in seconds"
    # arg pathname
    if [ -n "$argv[1]" ]
        set -f pathname "$argv[1]"
	set -e argv[1]
    else
        begin; echo "$(status function): missing pathname?"; return 1; end >&2
    end

    # arg format, default S, one of S, M, H, d
    set -f format S
    if [ -n "$argv[1]" ]
        set -f format "$argv[1]"
	set -e argv[1]
    end

    datediff -f %$format (date -d @(path mtime "$pathname" -Iseconds)) now
end
