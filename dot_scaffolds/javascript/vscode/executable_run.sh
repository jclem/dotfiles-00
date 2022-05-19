#!/usr/bin/env bash

set -e

fish -c 'scaffold run vscode/common'

tmp="$(mktemp)"

jq '.["editor.codeActionsOnSave"]["source.organizeImports"] = true' \
  < ".vscode/settings.json" \
  > "$tmp"

cp "$tmp" ".vscode/settings.json"
