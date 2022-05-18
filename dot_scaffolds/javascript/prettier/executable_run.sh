#!/usr/bin/env bash

set -e

cp "$(dirname -- "${BASH_SOURCE[0]}")"/config.yml .prettierrc.yml
