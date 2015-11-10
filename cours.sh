#!/bin/sh

docker run -d \
  --name cours \
  -p 3000:3000 \
  -v /var/node:/usr/node \
  -v /home/vibioh/code/md-genie-logiciel:/usr/src \
  -w /usr/src \
  --read-only \
  -m 256M \
  --cpu-shares=512 \
  vibioh/node:latest \
  node ./server/server.js
