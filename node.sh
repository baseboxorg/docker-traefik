#!/bin/sh

SUBDOMAIN=${1:-node}
NODE_PORT=${2:-3000}
WORKING_DIR=${3:-/home/admin/project}
NODE_COMMAND=${4:-server.js}
NODE_GLOBAL_DIR=${5:-/var/node}

docker run -d \
  --name ${SUBDOMAIN} \
  -l traefik.port=${NODE_PORT} \
  -l traefik.frontend.passHostHeader=true \
  -v ${WORKING_DIR}:/usr/src \
  -v ${NODE_GLOBAL_DIR}:/usr/node \
  -w /usr/src \
  --read-only \
  -m 256M \
  --cpu-shares=512 \
  vibioh/node:latest \
  node ${NODE_COMMAND}
