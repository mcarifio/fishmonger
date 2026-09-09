#!/usr/bin/env fish

# eget ollama/ollama
# brew install ollama

guard command ollama; or return 0
set -l models  "$HOME/.config/ollama/models"
mkdir -p "$models"
Ux OLLAMA_MODELS="$models"





