command -q direnv &>/dev/null; or return 0

# hack: attach a variable change function to PWD to `direnv allow` iff:
# * direnv on PATH
# * $PWD/.envrc exists
# note: I shadow sudo within this function to 
# 
function _on_cd --on-variable PWD -d "actions when entering a folder"
    [ -f .envrc ]; or return 0
    if functions -q sudo; functions -c sudo{,_orig}; and echo "(status function) disabling sudo temporarily" >&2; end
    function sudo; echo (status function) $argv "  ## sudo disabled" >&2; status print-stack-trace >&2; end
    direnv allow 2>/dev/null
    functions -q sudo_orig; and functions -c sudo{_orig,}; or functions -e sudo
end
    