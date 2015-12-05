#!/bin/sh

docker run -d \
  --name rancher \
  -p 8080:8080 \
  -v /var/rancher/mysql:/var/lib/mysql \
  -v /var/rancher/cattle:/var/lib/cattle \
  -m 1G \
  --cpu-shares=512 \
  rancher/server:latest
