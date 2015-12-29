#!/bin/sh

docker run -d \
  --name rabbit \
  --hostname rabbitmq \
  -p 5672:5672 \
  -l traefik.port=15672 \
  -l traffic.frontend.passHostHeader=true \
  -m 512M \
  --cpu-shares=256 \
  rabbitmq:3-management \
  sh -c 'echo "[{rabbit, [{loopback_users, []}, {default_vhost,<<\"rabbit\">>}, {vm_memory_high_watermark, {absolute,471859200}}]}]." > /etc/rabbitmq/rabbitmq.config && rabbitmq-server'
