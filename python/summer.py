# This script reads numbers of a file (line by line) and add them together.
# Reason I created this script is that Excel is a pain in the ass when it comes to numbers with dots instead of commas.

total = 0

with open('input.txt', 'r') as inp:
   for line in inp:
       try:
           num = float(line)
           total += num
       except ValueError:
           print('{} is not a number!'.format(line))

print('Total is: {}'.format(total))
