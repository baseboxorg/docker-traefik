#!/bin/sh

docker run -d \
  --name maildev \
  -p 1025:1025 \
  -p 1080:1080 \
  --read-only \
  -m 256M \
  --cpu-shares=512 \
  vibioh/maildev:latest

