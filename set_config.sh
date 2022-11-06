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
			cd ~/$(dirname "$t")
			cmd="ln -sf $destPath"
			echo $cmd
			eval $cmd
		)
	fi
done
