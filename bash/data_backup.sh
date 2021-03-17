#!/bin/bash

tar -cvzf ~/Desktop/backup.tar.gz ~/{Documents,Downloads,Desktop,Pictures,Videos}
# or
# tar -czf backup.tar.gz ~/{Documents,Downloads,Desktop,Pictures,Videos} 2>/dev/null
# means: redirect standard error to /dev/null. /dev/null is a special device that discards everything that is written to it
