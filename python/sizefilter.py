#!/usr/bin/python3

# Demonstrate piping out of a child process
# Print names of files bigger than 10000 bytes

from subprocess import Popen, PIPE

lister = Popen(["ls", "-l"], stdout=PIPE)

for bytes in lister.stdout:
    line = bytes.decode()
    if line.startswith("total"):
        continue
    splitline = line.split()
    # Size is in field 4, name in field 8
    if int(splitline[4]) > 10000:
        print(splitline[8])
        
