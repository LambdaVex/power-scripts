#!/bin/bash

# List of passwords
input="words"
# File to decrypt 
vault="file.7z"

while IFS= read -r line
do
  7z t -p"$line" $vault > /dev/null 2>&1 && echo correct || echo wrong 
done < "$input"
