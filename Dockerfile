FROM debian:10

ENV DOWNLOAD_URL https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.39-9772-beta/softether-vpnserver-v4.39-9772-beta-2022.04.26-linux-x64-64bit.tar.gz

RUN apt-get update && apt-get install -y curl tar gzip grep make gcc cpp
RUN curl -L -o /opt/softether.tar.gz $DOWNLOAD_URL && tar xzfp /opt/softether.tar.gz -C /opt 
RUN cd /opt/vpnserver && make main

COPY files/* /opt/
RUN chmod 755 /opt/*.sh

#ENTRYPOINT /bin/bash
ENTRYPOINT /opt/start.sh
