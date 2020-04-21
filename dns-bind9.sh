#!/bin/bash
    docker run -d -it \
    --name="dns-bind9" \
    --restart="unless-stopped" \
    --network="host" \
    -P \
    -v /etc/timezone:/etc/timezone:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /home/alex/docker/bind:/etc/bind \
    -v /var/log/named:/var/log/named \
    dns-bind9:latest
