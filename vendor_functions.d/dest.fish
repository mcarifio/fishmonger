function (fn (status filename)) -d "$(fn (status filename)) |> directory pathname, materializing it if necessary"
    # @usage: mv -v foo (dest /tmp/foo/bar)/
    argparse -us -- $argv

    [ -n "$argv[1]" ]; or begin; echo "(status function): expecting a target pathname" >&2; return 1; end
    [ -d "$argv[1]" ]; or mkdir $argv_opts -p "$argv[1]"
    [ -d "$argv[1]" ]; or begin; echo "(status function): expecting a target pathname" >&2; return 1; end
    echo "$argv[1]"    
end