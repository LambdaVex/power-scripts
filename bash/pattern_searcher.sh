#!/bin/bash

# Script that searches for folders/files and file's content that matches a defined pattern
# Author: Ali Denno

if [[ $# -ne 1 ]]; then
	echo "Need exactly one argument"
	exit 1
fi

pattern="$1"

printf "> Found in the following files:\n"
grep -rnwi . -e $pattern | xargs -L1 echo
printf "\n> Found the following folders:\n"
find . -name $pattern | xargs -L1 echo
# find / -type f -name "catalina.sh"

#alternatively
#find . -name $pattern | while read line ; do echo $line ; done
