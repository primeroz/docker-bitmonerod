FROM ubuntu:14.04
MAINTAINER Levin Keller <github@levinkeller.de>

RUN apt-get update && apt-get install -y \
 git \
 build-essential \
 bsdmainutils \
 libunbound-dev \
 libevent-dev \
 libgtest-dev \
 libboost-dev

COPY start.sh /scripts/start.sh

COPY buildAndInstallMonero.sh /scripts/buildAndInstallMonero.sh

RUN /scripts/buildAndInstallMonero.sh

ENV RPC_USER=user \
    RPC_PASSWORD=password \
    RPC_PORT=8332

VOLUME /monero

EXPOSE 8333 8332

ENTRYPOINT ["/scripts/start.sh"]

