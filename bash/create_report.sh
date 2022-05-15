#!/bin/zsh

# Create a report file for a single shipping container

if [[ ! $input_file ]]; then
    echo "Error: Input file not configured"
    exit 1
fi

if [[ -e $input_file ]]; then
    echo "Error: Input file $input_file does not exist"
    exit 1
fi

if [[ ! $1 ]]; then
    echo "Error: missing parameter: container name"
    exit
fi

if [[ $2 ]]; then
    directory="$2"
else
    directory="$HOME/reports"
fi
container="$1"

mkdir -p -- "$directory"
if grep -- "$container" "$input_file" > "$output_file"; then
    echo "Wrote report $output_file"
else
    echo "container $container not found"
fi
