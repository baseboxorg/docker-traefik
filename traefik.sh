#!/bin/sh

LISTEN_POST=${1:-80}
WEB_PORT=${2:-8080}
DOCKER_CONFIG_DIR=${3:-/var/data}

docker run -d \
  --name traefik \
  -p ${LISTEN_POST}:80 \
  -l traefik.port=${WEB_PORT} \
  -l traefik.frontend.passHostHeader=true \
  -v /var/run/docker.sock:/var/run/docker.sock
  -v ${TRAEFIK_CONFIG_DIR}/traefik.toml:/traefik.toml
  --read-only \
  --restart=yes \
  -m 1G \
  --cpu-shares=512 \
  emilevauge/traefik:latest
