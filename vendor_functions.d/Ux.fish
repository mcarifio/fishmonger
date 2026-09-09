function Ux -d 'set -Ux var=value...'
    for p in $argv
        set -l parts (string split = $p)
        set -Ux $parts[1] $parts[2]
    end    
end
