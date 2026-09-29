if command ls --version 2>/dev/null | string match -q '*uutils coreutils*'
    set -gx __fish_ls_command /usr/bin/gnuls
    abbr -a ls gnuls
end

