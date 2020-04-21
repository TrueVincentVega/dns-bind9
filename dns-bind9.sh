#!/bin/bash
docker run -d -it \
    --name="dns-bind9" \
    --restart="unless-stopped" \
    --network="host" \
    -p 53 \
    -p 53/udp \
    -v /home/alex/docker/bind:/etc/bind \
    -v /var/log/named:/var/log/named \
    -v /etc/localtime \
    -v /etc/timezone \
    dns-bind9:latest
