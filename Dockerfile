#########################################################
# Dockerfile to build DNS server bind9 container images #
# Based on Ubuntu 18.04                                 #
#########################################################

FROM ubuntu:18.04
MAINTAINER drpesojr

# Update and install DNS server bind9
RUN apt update && apt install bind9 -y

# Make directory for log files of bind9
RUN mkdir /var/log/named
RUN chown bind:bind /var/log/named
RUN chown -R root:bind /etc/bind
RUN chmod -R 664 /etc/bind
RUN chmod 774 /etc/bind

# ENTRYPOINT
ENTRYPOINT /bin/bash

#ENV
ENV DEBIAN_FRONTEND noninteractive

# WORKDIR
WORKDIR /root

# ADD script to autostart service bind9
ADD autostartbind9.sh /root/autostartbind9.sh
RUN chmod 774 /root/autostartbind9.sh

# ADD file to corect ip v6 output logs of service bind9
ADD bind9.v6.options /etc/default/bind9
ADD chmod 644 /etc/default/bind9	

# Default port of DNS server bind9
EXPOSE 53
EXPOSE 53/udp

# VOLUME - directory with config files
VOLUME /etc/bind

# VOLUME - directory with log files
VOLUME /var/log/named

# VOLUME - directorys with corect files localtime & timezone from your host (used for correct time in container)
VOLUME /etc/timezone
VOLUME /etc/localtime

# Change file .bashrc to autoload script autostartbind9.sh
RUN echo "/root/./autostartbind9.sh" >> .bashrc
