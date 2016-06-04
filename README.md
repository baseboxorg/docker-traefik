# docker-traefik

```
export DOMAIN=vibioh.fr
export DOCKER_HOST=163.172.154.82:2375
export DOCKER_CERT_PATH=/root/code/docker-swarm/swarm-cert
docker-compose -p traefik -f docker-compose.yml -f docker-compose.swarm.yml up -d
```

