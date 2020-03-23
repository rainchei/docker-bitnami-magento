FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime \
  && apt-get -y clean \
  && apt-get -y update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends \
    software-properties-common \
    tzdata \
    locales \
    curl \
    vim \
    net-tools \
    bsdtar \
    wget \
    gosu

CMD ["/bin/sh"]
