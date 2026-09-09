#!/usr/bin/env fish

# Where is homebrew installed?
set -l HOMEBREW_PREFIX (value $argv[1] /home/linuxbrew/.linuxbrew)

# Does it have a brew command there?
if [ -x "$HOMEBREW_PREFIX/bin/brew" ]
    # Yes, configure that location.
    Ux HOMEBREW_PREFIX="$HOMEBREW_PREFIX" HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar" HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX/Homebrew" INFOPATH="$HOMEBREW_PREFIX/share/info"
else
    # No, die.
    die "'$HOMEBREW_PREFIX/bin/brew' not found"
end

fish_add_path $HOMEBREW_PREFIX/{sbin,bin}
brew --prefix >&2


    
    
