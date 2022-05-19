#!/usr/bin/env bash

set -e

tmp="$(mktemp)"

mkdir -p .vscode

if ! test -f ".vscode/settings.json"; then
  echo "{}" > ".vscode/settings.json"
fi

jq '.["editor.formatOnSave"] = true' \
  < ".vscode/settings.json" \
  > "$tmp"

cp "$tmp" ".vscode/settings.json"
