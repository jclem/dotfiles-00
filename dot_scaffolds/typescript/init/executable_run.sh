#!/usr/bin/env bash

set -e

fish -c 'scaffold run javascript/init'

npm i -D typescript

cp "$(dirname -- "${BASH_SOURCE[0]}")"/config.json tsconfig.json

tmp="$(mktemp)"

jq '.scripts["check:build"] = "tsc --noEmit"' \
  < "package.json" \
  > "$tmp"

cp "$tmp" "package.json"
