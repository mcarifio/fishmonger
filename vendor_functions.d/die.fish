function die -a msg
    # return|exit with status of last error or 1; die means an error
    # `die` is intended to be used in fish scripts (-x).
    set -l _status $status
    [ $_status -eq 0 ]; and set -l _status 1

    # announce your death
    echo "$(value "$msg" error)" >&2

    # exit from scripts only
    status is-interactive; and return $_status; or exit $_status
end
