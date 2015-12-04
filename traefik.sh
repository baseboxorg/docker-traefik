#!/bin/sh

docker run -d \
  --name traefik \
  -p 80:80 \
  -v `realpath ${1:-traefik.toml}`:/traefik.toml \
  -v `realpath ${1:-rules.toml}`:/rules.toml \
  --read-only \
  -m 128M \
  --cpu-shares=128 \
  emilevauge/traefik:latest
