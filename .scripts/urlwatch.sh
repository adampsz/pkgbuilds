#!/usr/bin/env bash
cd "$(dirname "$0")" || exit 1
urlwatch --urls urlwatch.yml --cache urlwatch.db "$@"
