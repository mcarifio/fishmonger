function (fn (status filename))
    set -Up previous_fish_user_paths $fish_user_paths    
    set -eU fish_user_paths

    fish_add_path --append /usr/local/{s,}bin /usr/{s,}bin /{s,}bin

    command -q go; and fish_add_path (go env GOPATH)/bin
    command -q uv; and fish_add_path ~/.local/share/uv/tools/*/bin
    command -q python; and fish_add_path (python -m site --user-base)/bin
    [ -d ~/.cargo/bin ]; and fish_add_path ~/.cargo/bin

    set -l linuxbrew /home/linuxbrew/.linuxbrew
    if path is -d $linuxbrew/bin        
        fish_add_path $linuxbrew/{Homebrew/,}bin        
    end
end
