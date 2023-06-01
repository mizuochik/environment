#!/bin/bash

set -eu

while read t
do
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
			target_dir=~/$(dirname "$t")
			cd "$target_dir"
			cmd='ln -sf "'$destPath'"'
			echo $cmd
			eval $cmd
		)
	fi
done
