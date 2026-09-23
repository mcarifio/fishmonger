function (fn (status filename))
    # @usage: mv -v foo (dest /tmp/foo/bar)/

    # passthru argv_opts to mkdir below
    argparse -us -- $argv

    [ -n "$argv[1]" ]; or begin; echo "(status function): expecting a target pathname" >&2; return 1; end
    [ -d "$argv[1]" ]; or mkdir $argv_opts -p "$argv[1]"
    [ -d "$argv[1]" ]; or begin; echo "(status function): expecting a target pathname" >&2; return 1; end
    echo "$argv[1]"    
end