#!/bin/sh

WORDPRESS_NAME=${1:-wordpress}

docker run -d \
  --name ${WORDPRESS_NAME}_volumes \
  --read-only \
  vibioh/wordpress:latest

docker run -d \
  --name ${WORDPRESS_NAME}_mysql \
  -e MYSQL_ROOT_PASSWORD=s3Cr3T! \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wordpress \
  -e MYSQL_PASSWORD=W0rdPr3Ss! \
  -l traefik.enable=false \
  --volumes-from ${WORDPRESS_NAME}_volumes \
  --read-only \
  -m 512M \
  --cpu-shares=512 \
  vibioh/mysql:latest

docker run -d \
  --name ${WORDPRESS_NAME}_mail \
  -l traefik.port=1080 \
  -l traefik.frontend.passHostHeader=true \
  --read-only \
  -m 128M \
  --cpu-shares=128 \
  vibioh/maildev:latest

docker run -d \
  --name ${WORDPRESS_NAME} \
  --link ${WORDPRESS_NAME}_mysql:db \
  --link ${WORDPRESS_NAME}_mail:smtp \
  -e SMTP_URL=smtp \
  -e SMTP_PORT=1025 \
  -l traefik.port=1080 \
  -l traefik.frontend.passHostHeader=true \
  --volumes-from ${WORDPRESS_NAME}_volumes \
  -m 512M \
  --cpu-shares=512 \
  vibioh/php:latest

