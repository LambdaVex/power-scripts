#!/bin/bash

mkdir ~/Desktop/test_data
cd ~/Desktop/test_data
touch file{1..100}
ls -lh ~/Desktop/test_data > ~/Desktop/test_data.log
