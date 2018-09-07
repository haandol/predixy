FROM ubuntu:18.04

LABEL maintainer="haandol <ldg55d@gmail.com>"

ENV VERSION 1.0.4

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y build-essential wget unzip \
    && wget --no-check-certificate https://github.com/joyieldInc/predixy/archive/${VERSION}.zip -O predixy-${VERSION}.zip \
    && unzip predixy-${VERSION}.zip \
    && cd predixy-${VERSION} \
    && make \
    && mv src/predixy /usr/local/bin \
    && mkdir -p /etc/predixy/conf

ADD conf /etc/predixy/conf

CMD ["/usr/local/bin/predixy", "/etc/predixy/conf/predixy.conf"]
