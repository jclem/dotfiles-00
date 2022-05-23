#!/usr/bin/env bash

set -e

fish -c 'scaffold run javascript/init'

npm i -D prettier

cp "$(dirname -- "${BASH_SOURCE[0]}")"/config.yml .prettierrc.yml

tmp="$(mktemp)"

jq '.scripts["check:format"] = "prettier --loglevel warn --check ."' \
  < "package.json" \
  > "$tmp"

cp "$tmp" "package.json"
