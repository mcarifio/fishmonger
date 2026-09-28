function dedup
    # remove duplicates from the back
    # set -Ux fish_function_path (dedup $fish_function_path)
    # set -Ux fish_function_path (dedup $fish_complete_path)
    set -l i 1

    while test $i -le (count $argv)
        set -l j (math $i + 1)

        while test $j -le (count $argv)
            if test "$argv[$i]" = "$argv[$j]"
                set -e argv[$j]
            else
                set j (math $j + 1)
            end
        end

        set i (math $i + 1)
    end

    printf '%s\n' $argv
end
