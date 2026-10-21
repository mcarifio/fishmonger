function (fn (status filename))
    set -f _status $status
    set -f _true true; set -q argv[1]; and set -f _true "$argv[1]"
    set -f _false false; set -q argv[2]; and set -f _false "$argv[2]"
    [ $_status -eq 0 ]; and echo $_true; or echo $_false
    return $_status
end