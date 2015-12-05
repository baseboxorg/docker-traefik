#!/bin/sh

docker run -d \
  --name rancher \
  -p 8080:8080 \
  --label traefik.port=8080 \
  --label traefik.frontend.passHostHeader=true \
  -v /var/rancher/mysql:/var/lib/mysql \
  -v /var/rancher/cattle:/var/lib/cattle \
  -m 1G \
  --cpu-shares=512 \
  rancher/server:latest
