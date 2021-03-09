#!/bin/bash

# This script merges a .ts video file and a .aac audio file and outputs a mp4 file
# Author: Ali Denno
# Example: media_merger.sh "video.ts" "audio.aac" "output.mp4"

ffmpeg -i $1 -i $2 -map 0:V:0 -map 1:a:0 -c copy -f mp4 -movflags +faststart $3
