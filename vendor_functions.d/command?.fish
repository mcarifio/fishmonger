function command? -a cmd
    command -q (path basename --no-extension $cmd)
end
