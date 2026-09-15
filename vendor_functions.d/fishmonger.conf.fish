function (fn (status filename))
    # link ../conf.d/fishmonger.conf.fish into ~/.config/fish/conf.d to configure fishmonger on interactive start
    ln -srf (path resolve (functions --details (status function))/../../conf.d/(status function).conf.fish) $__fish_config_dir/conf.d
end
