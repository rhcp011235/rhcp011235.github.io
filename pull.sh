#!/bin/bash

# Pull the new changes to the blog
cd /var/www/jbhale.com/blog
/usr/bin/git pull >> /tmp/test.log

echo "WORKED" >> /tmp/test.log

#echo "A new archive has been created at /archives/${2}-master.tar" | mail -s 'Github project build successul!' 'your@email.com'

