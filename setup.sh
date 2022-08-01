#!/bin/bash

set -e

targets=$(find . | grep -v /.git[/$] | grep -v README.md | grep -v setup.sh | sed -e 's/^.\///g')
for t in $targets
do
	destpath=$(pwd)/$t
	if [[ -d $t ]]
	then
		(
			cd ~
			mkdir -p "$t"
		)
	elif [[ -f $t ]]
	then
		destPath=$(pwd)/$t
		(
			cd ~/$(dirname "$t")
			cmd="ln -sf $destPath"
			echo $cmd
			$cmd
		)
	fi
done
