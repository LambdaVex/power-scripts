#!/bin/bash

# Script that prints the names of files in the current directory to a text file
# Author: Ali Denno

script=`basename "$0"`
d=`date +%m.%d.%Y_%H.%M.%S`
file="result"_$d
for entry in "."/*
do
  if [ -f "$entry" ] && [ $script != "$(basename "$entry")" ]; then
    echo "$(basename "$entry")" >> $file.txt
  fi
done
