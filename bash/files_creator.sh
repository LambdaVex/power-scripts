#!/bin/bash

# This script reads each line in a input.dat file and creates a file in the same directory with a name that corresponds to that line
# Author: Ali Denno

input="./input.dat"
if [[ -e "$input" ]]; then
	while IFS= read -r line
	do
	  if [[ ! -e "$line" ]]; then
		  echo > "$line"
	  fi
	done < "$input"
fi
