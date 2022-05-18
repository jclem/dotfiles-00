#!/usr/bin/env bash

set -e

tmp="$(mktemp)"

if ! test -f ".vscode/settings.json"; then
  echo "{}" > ".vscode/settings.json"
fi

jq '.["editor.formatOnSave"] = true
  | .["editor.codeActionsOnSave"]["source.organizeImports"] = true' \
  < ".vscode/settings.json" \
  > "$tmp"

cp "$tmp" ".vscode/settings.json"
