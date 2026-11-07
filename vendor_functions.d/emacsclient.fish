# if emacsclient is installed, wrap it
if command -q (fn (status filename))
  function (fn (status filename)) -w (fn (status filename)) -d "augments emacsclient with initial flags"
      # setting alternate-editor to null string defaults to `emacs --daemon` first and then connecting to that emacs server
      set -l fish_trace 1
      _cmd=(status function) command $_cmd --alternate-editor= --reuse-frame --no-wait --timeout=20 --quiet $argv
  end
else
  # else error it
  echo "$(path resolve (status filename)): command $(fn (status filename)) not found, skipping..." >&2
  return 1
end