#!/usr/bin/env bash

set -e

fish -c 'scaffold run typescript/init'

cp "$(dirname -- "${BASH_SOURCE[0]}")"/config.yml .eslintrc.yml

npm i -D @typescript-eslint/parser \
  @typescript-eslint/eslint-plugin \
  eslint-config-prettier

tmp="$(mktemp)"

jq '.scripts["check:lint"] = "eslint ."' \
  < "package.json" \
  > "$tmp"

cp "$tmp" "package.json"

