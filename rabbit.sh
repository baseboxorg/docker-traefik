#!/bin/sh

docker run -d \
  --name rabbit \
  --hostname rabbitmq \
  -p 5672:5672 \
  --label traefik.port=15672 \
  --label traffic.frontend.passHostHeader=true \
  rabbitmq:3-management \
  sh -c 'echo "[{rabbit, [{loopback_users, []}, {default_vhost,<<\"rabbit\">>}]}]." > /etc/rabbitmq/rabbitmq.config && rabbitmq-server'`
