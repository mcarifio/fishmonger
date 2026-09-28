# install and conf drop on first use iff needed
# fm.need --cmd=drop,apt://drop:eget://wrr/drop --conf "$(status filename)"; or return 1

function (fn (status filename)) -w (fn (status filename))
    argparse -us -- $argv
    # forward command and switches
    cmd=(status function) command $cmd $argv_opts $argv
end
