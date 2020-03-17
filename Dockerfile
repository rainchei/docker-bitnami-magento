FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive \
    PHP_VERSION=7.2 \
    TINI_VERSION=v0.18.0

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
    php-pear \
    php${PHP_VERSION}-dev \
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-soap \
    php${PHP_VERSION}-bcmath \
  && apt-get install -y \
    composer \
  && chmod +x /usr/bin/tini

# Install magento2
RUN \
  mkdir -p /var/www \
  && cd /var/www \
  && wget https://github.com/magento/magento2/archive/2.3.4.tar.gz \
  && tar -xf 2.3.4.tar.gz \
  && mv magento2-2.3.4 magento2

# Generate code and static contents
COPY ./magento2/ /var/www/magento2/

RUN \
  cd /var/www/magento2 \
  && composer install -v \
  && ./bin/magento setup:di:compile --no-interaction --no-ansi \
  && ./bin/magento setup:static-content:deploy --no-interaction --no-ansi \
    --strategy=compact \
    -f \
  && chown -R www-data:www-data /var/www/magento2/

# Post install
COPY ./etc/ /etc/

RUN \
  chmod +x /etc/entrypoint.sh \
  && mkdir -p /run/php

WORKDIR /var/www/magento2

# ---

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]

CMD ["bash", "-c", "/etc/entrypoint.sh"]
