#!/bin/bash

set -eu

git_ignores=$(cat .gitignore | sed -E 's/^\///' | sed -E 's/\/$//')

find_cmd='find . -not -path . -and -not -path "./.git*" -and -not -path ./.gitignore -and -not -path ./README.md -and -not -path "./mk-tools*" -and -not -path ./.envrc -and -not -path "./*_config.sh"'
for path in $git_ignores
do
    find_cmd="$find_cmd -and -not -path \"./$path*\""
done

eval $find_cmd | sed -E 's/\.\///'
