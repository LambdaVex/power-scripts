#!/bin/bash

# This script compares two directories based on the number of files in each
# Author: Ali Denno

if [[ $# -ne 2 ]]; then
	echo "Need exactly two arguments"
	exit 1
fi

if [[ ! -d $1  ]]; then
	echo "'$1' is not a directory"
	exit 1
fi
if [[ ! -d $2  ]]; then
	echo "'$2' is not a directory"
	exit 1
fi

dir1="$1"
dir2="$2"
# Get number of files in directories
count_1=$(ls -A1 "$dir1" | wc -l)
count_2=$(ls -A1 "$dir2" | wc -l)

# Which one has most files?
if [[ $count_1 -gt $count_2 ]]; then
	echo "${dir1} has most files"
elif [[ $count_1 -eq $count_2 ]]; then
	echo "number of files is equal"
else 
	echo "${dir2} has most files"
fi

exit 0
