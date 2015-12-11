#!/bin/sh

WORDPRESS_NAME=${1:-wordpress}
WORDPRESS_DIR=${2:-/var/wordpress}

docker run -d \
  --name ${WORDPRESS_NAME} \
  -v ${WORDPRESS_DIR}/${WORDPRESS_NAME}/mysql:/var/lib/mysql
  -v ${WORDPRESS_DIR}/${WORDPRESS_NAME}/www:/var/www/localhost
  --read-only \
  -m 512M \
  --cpu-shares=512 \
  vibioh/wordpress:latest

docker run -d \
  --name ${WORDPRESS_NAME}_mysql \
  -e MYSQL_ROOT_PASSWORD=s3Cr3T! \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wordpress \
  -e MYSQL_PASSWORD=W0rdPr3Ss! \
  -l traefik.enable=false \
  --volumes-from ${WORDPRESS_NAME} \
  --read-only \
  -m 512M \
  --cpu-shares=512 \
  vibioh/mysql:latest

docker run -d \
  --name ${WORDPRESS_NAME}_php \
  --link ${WORDPRESS_NAME}_mysql:db \
  -l traefik.port=1080 \
  -l traefik.frontend.passHostHeader=true \
  --volumes-from ${WORDPRESS_NAME} \
  --read-only \
  vibioh/php:latest
