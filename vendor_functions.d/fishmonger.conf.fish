function (fn (status filename))
    # link ../conf.d/fishmonger.conf.fish into ~/.config/fish/conf.d to configure fishmonger on interactive start
    set -l fishmonger_conf_pn (path resolve (fishmonger.root)/vendor_conf.d/(status function).fish)
    set -l fish_conf_d  $__fish_config_dir/conf.d
    ln -srf $fishmonger_conf_pn $fish_conf_d

    # source the linked .fish file as a convenience
    [ -r "$conf" ]; and source $conf
end
