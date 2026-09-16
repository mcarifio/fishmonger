function (fn (status filename))
    # link ../conf.d/fishmonger.conf.fish into ~/.config/fish/conf.d to configure fishmonger on interactive start
    set -l fishmonger_conf_pn (path resolve (functions --details (status function))/../../conf.d/(status function).fish)
    set -l fish_conf_d  $__fish_config_dir/conf.d
    ln -srf $fishmonger_conf_pn $fish_conf_d

    # source the linked .fish file as a convenience
    set -l conf $fish_conf_d/(status function).fish
    [ -r "$conf" ]; and source $conf
end
