# function (rcvrf (status filename) --db=db:pathname) --no-scope-shadowing
function (fn (status filename))
    # broken
    # argparse -us show\& db=\& 'a/author=&' 'c/category=&' -- $argv or return
    # set -q _flag_author_value
    #    or set -f _flag_author_value '[^-]+'
    # set -q _flag_category_value
    #    or set -f _flag_category_value '[^.]+'a
    # set -f db (value "$_flag_db_value" "$(zlib+db)")

    set -f author (value "$argv[1]" '[^-]+' )
    set -f category (value "$argv[2]" '[^.]+' )

    locate --database="$(zlib+db)" --regex -- "-$author-[[:digit:]]{4}\.$category\."
end
