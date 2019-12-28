#!/bin/bash

# Script that number files in the current directory according to when they were created
# Author: Ali Denno

mydir=$(mktemp -d "${TMPDIR:-/tmp/}$(basename $0).XXXXXXXXXXXX")
info=$(for entry in "."/*; do echo "$(basename "$entry"),$(stat -c %z "$(basename "$entry")")" ; done | sort -t ',' -k2 | cut -d ',' -f1 > $mydir/result.txt)
script=`basename "$0"`

n=1
while read line; do
    if [ -f "$line" ] && [ $script != "$(basename "$line")" ]; then
        if ((n >= 0 && n < 10)); then
            mv "$line" "0$n. $line"
            n=$((n+1))
        else
            mv "$line" "$n. $line"
            n=$((n+1))
        fi
    fi
done < "$mydir/result.txt"

trap "rm -rf $mydir" EXIT