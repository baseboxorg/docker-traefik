#!/bin/sh

set -e

docker run \
    -d \
    --name traefik \
    -p 80:80 \
    --label traefik.frontend.passHostHeader=true \
    --label traefik.frontend.rule="Host: traefik.${DOMAIN}" \
    --label traefik.port=8080 \
    --net=swarm-net \
    -v ${CERT_PATH}:/ssl \
    --read-only \
    traefik -c /dev/null --web --web.readOnly --docker --docker.domain=${DOMAIN} --docker.endpoint tcp://${SWARM_IP}:2375 --docker.tls --docker.tls.ca /ssl/ca.pem --docker.tls.cert /ssl/cert.pem --docker.tls.cert /ssl/key.pem --docker.tls.insecureSkipVerify