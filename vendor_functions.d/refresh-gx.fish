function (fn (status filename)) -d 'assign/refresh -g vars from their -U values'    
    set -l args $argv

    # refresh-gx var0 var1 var2 ...
    # to promote all universal variables to globals: refresh-gx (set -nU) ## but usually unnecessary
    
    for _var in $argv
        # if $_var has no universal value, skip this var
        set -qU $_var; or continue
        
        # capture _var's current value        
        set -l previous_gx $$_var

        # export if universal or global is exported (hacky)
        set -l x ''
        set -qgx $_var; or set -qUx $_var; and set -l x x
        
        # erase the global binding
        set -eg $_var

        # assign/reassign the global with it's universal value
        set -g$x $_var $$_var
        set -s $_var >&2
        
        # if reassignment lost the old global value,
        #   prepend to previous_$var and show it.
        [ "$previous_gx" = "$$_var" ]; and continue
        set -gp {$_var}_previous $previous_gx
        set -s {$_var}_previous >&2
    end
end