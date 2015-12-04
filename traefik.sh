#!/bin/sh

docker run -d \
  --name traefik \
  -p 80:80 \
  -v $(pwd)/traefik.toml:/traefik.toml \
  -v $(pwd)/rules.toml:/rules.toml \
  --read-only \
  -m 256M \
  --cpu-shares=512 \
  emilevauge/traefik:latest
