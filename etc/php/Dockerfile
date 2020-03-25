FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive \
    PHP_VERSION=7.2 \
    TINI_VERSION=v0.18.0 \
    DOCKERIZE_VERSION=v0.6.1

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini

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
    gosu \
  && locale-gen en_US.UTF-8 \
  && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php -y \
  && apt-get install -y \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-xsl \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-dev \
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-soap \
    php${PHP_VERSION}-bcmath \
    php-pear \
    composer \
  && curl -sSLf "https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" \
    | bsdtar -C /usr/bin -xzvf - dockerize \
  && mkdir -p /var/run/php \
  && chmod +x /usr/bin/tini

# Post install
COPY ./etc/ /etc/

WORKDIR /var/www/html

# ---

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]

CMD ["bash", "bin/entrypoint.sh"]
