#!/bin/bash
rm -rf /run/httpd/* /tmp/httpd*
httpd
umask 022
while true; do
    rsync -avz --delete --safe-links rsync.apache.org::apache-dist /opt/httpd/htdocs
    sleep 43200 # 12 hours
done