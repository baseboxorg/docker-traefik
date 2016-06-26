# docker-traefik

## On Single Daemon

```
export DOMAIN=vibioh.fr
docker-compose -p traefik up -d
```

## On Swarm

```
export DOMAIN=vibioh.fr
export DOCKER_HOST=163.172.154.82:2375
export DOCKER_CERT_PATH=/root/code/docker-swarm/swarm-cert
docker-compose -p traefik -f docker-compose.yml -f docker-compose.swarm.yml up -d
```

