#!/bin/bash

webserv="www.google.com" 
keyword="googleg_standard_color_128dp.png"

if curl -s "$webserv" | grep -q "$keyword"
then
    echo "OK"
else
    echo "Error"
fi
