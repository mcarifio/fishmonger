set -l fn (fn (status filename))

function $fn
    # map $verb argv... |> $verb $a for each a in argv
    # mapj $verb argv... |> $verb $a as a json object for a in argv
    set -f fn (status function)
    argparse -us -- $argv
    # enumerate just the results
    f={$fn}j $f $argv_opts $argv | jq -r '.[].result'
end

function {$fn}j
    set -f fn (status function)
    argparse -us -- $argv    
    f=_{$fn} $f $argv_opts $argv | jq .
end

function _{$fn}j
    set -f fn (status function)
    argparse -us -- $argv    

    # verb, a function/command of 1 arg to be applied
    [ -n "$argv[1]" ]; or begin; echo "$fn: missing verb"; return 1; end >&2
    set -f verb "$argv[1]"
    set -e argv[1]
    type -q $verb; or begin; echo "$fn: $verb not invokable"; return 1; end >&2

    # no args returns empty array
    set -q argv[1]; or begin; echo '[]'; return 0; end

    set -f call1 $fn.call1
    echo "["
    for a in $argv[..-2]; $call1 $verb $a; echo ","; end
    $call1 $verb $argv[-1]
    printf "\n]\n"
end


function _{$fn}j.call1 -a verb a
    set -f fn (status function)
    set -f tuple ($verb $a); set -f _status $status; set -f when (date -Iseconds -d now)
    set -f tuple (string split : $tuple)
    set -f result $tuple[1]; set -f rest $tuple[2..]    
    string match -rq '^\d+|true|false|null$' $result; or set -f result "\"$result\""
    string match -rq '^\d+|true|false|null$' $rest; or set -f rest "\"$rest\""
    printf '{ "call": "%s", "result": %s, "status": %i, "when": "%s", "rest": %s }' "$verb $a" $result $_status $when $rest
end

function identity -a value
    set -f fn (status function)
    echo "$value:$fn"
end

function bad_identity -a value
    set -f fn (status function)
    echo (identity $argv):$fn
    return 1
end
