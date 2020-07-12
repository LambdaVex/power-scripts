#!/bin/bash

# This script extracts mp3 (audio) from mp4 files and gathers them in a audio file 
# Author: Ali Denno

mkdir audio; for vid in *.mp4; do ffmpeg -i "$vid" "audio/${vid%.mp4}.mp3"; done
