function (fn (status filename))
  set -l skills /run/media/mcarifio/mobilehome0/mcarifio/.claude/skills/* (string split : $SKILLS)
  set -q skills[1]; and set -l skills (printf '--add-dir=%s ' $skills)
  _cmd=(status function) command $_cmd $skills $argv
end
