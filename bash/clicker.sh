#!/bin/bash

# you can get the current position using
# $ xdotool getmouselocation

while [ 1 ]; do
  xdotool mousemove 1489 663 click 1 &
  sleep 1
  xdotool mousemove 1046 662 click 1 &
  sleep 1 
done
