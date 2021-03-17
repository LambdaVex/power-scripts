#!/bin/bash

tar -cvzf ~/backups/backup.tar.gz ~/{Documents,Downloads,Desktop,Pictures,Videos}
date >> ~/backups/backups.log
# or
# tar -czf backup.tar.gz ~/{Documents,Downloads,Desktop,Pictures,Videos} 2>/dev/null
# means: redirect standard error to /dev/null. /dev/null is a special device that discards everything that is written to it
