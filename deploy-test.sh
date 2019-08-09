#!/usr/bin/env bash

server=root@192.168.90.5
app_path=/data/okr

rsync -u -r -v \
--exclude=node-km-sdk/node_modules \
--exclude=node_modules \
--exclude=.idea \
--exclude=.git \
--exclude=run \
--exclude=logs \
/Users/g/Desktop/work/okr ${server}:${app_path}

ssh ${server} "cd ${app_path} && npm run restart:qa2"

