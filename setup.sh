#!/bin/bash

set -eu

git_ignores=$(cat .gitignore | sed -E 's/^\///' | sed -E 's/\/$//')

find_cmd="find . -not -path \"./.git*\" -and -not -path ./.gitignore -and -not -path ./README.md -and -not -path \"./mk-tools*\""
for path in $git_ignores
do
    find_cmd="$find_cmd -and -not -path \"./$path*\""
done

eval $find_cmd | sed -E 's/\.\///' | while read t
do
    echo "Processing $t ..."
	destpath=$(pwd)/$t
	if [[ -d $t ]]
	then
		(
			cd ~
			cmd="mkdir -p \"$t\""
            echo $cmd
            eval $cmd
		)
	elif [[ -f $t ]]
	then
		destPath=$(pwd)/$t
		(
			cd ~/$(dirname "$t")
			cmd="ln -sf $destPath"
			echo $cmd
			eval $cmd
		)
	fi
done
