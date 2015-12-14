#!/bin/sh

docker run -d \
  --name maildev \
  -l traefik.port=1080 \
  -l traefik.frontend.passHostHeader=true \
  --read-only \
  -m 128M \
  --cpu-shares=128 \
  vibioh/maildev:latest

