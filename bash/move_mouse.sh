#!/bin/bash
LENGTH=100
DELAY=5
while true
do
    for ANGLE in 0 90 180 270
    do
        xdotool mousemove_relative --polar $ANGLE $LENGTH
        sleep $DELAY
    done
done
