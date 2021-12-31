#!/usr/bin/sh

cd "$(dirname "$0")"
urlwatch --urls urlwatch.yml --cache urlwatch.db
