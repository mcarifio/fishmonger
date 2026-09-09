#!/usr/bin/env fish
# assumes: brew install ollama

set -l cmd (path basename --no-extension (status filename))
command? $cmd; or die "$cmd not found"

set -l models  "$HOME/.config/ollama/models"
mkdir -p "$models" >&2
Ux OLLAMA_MODELS="$models"

[ "$(brew --prefix ollama)" = "$(command -s ollama)" ]; and brew services start ollama




