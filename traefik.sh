#!/bin/sh

LISTEN_POST=${1:-80}
WEB_PORT=${2:-8080}
TRAEFIK_DIR=${3:-/var/traefik}

docker run -d \
  --name traefik \
  -p ${LISTEN_POST}:80 \
  -l traefik.port=${WEB_PORT} \
  -l traefik.frontend.passHostHeader=true \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ${TRAEFIK_DIR}/traefik.toml:/traefik.toml \
  --read-only \
  -m 64M \
  --cpu-shares=512 \
  emilevauge/traefik:latest

