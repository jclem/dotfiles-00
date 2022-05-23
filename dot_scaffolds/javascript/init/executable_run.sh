#!/usr/bin/env bash

set -e

if ! test -f package.json; then
  echo "{}" > package.json
fi
