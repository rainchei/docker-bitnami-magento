FROM ubuntu:18.04

RUN \
  ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime \
  && apt-get -y clean \
  && apt-get -y update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends \
    tzdata \
    locales \
    curl \
    vim \
    net-tools \
    wget \
  && locale-gen en_US.UTF-8 \
  && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php -y \
  && apt-get install -y \
    php7.2-fpm \
    php7.2-curl \
    php7.2-cli \
    php7.2-mysql \
    php7.2-gd \
    php7.2-xsl \
    php7.2-json \
    php7.2-intl \
    php-pear \
    php7.2-dev \
    php7.2-common \
    php7.2-mbstring \
    php7.2-zip \
    php7.2-soap \
    php7.2-bcmath \
  && apt-get install -y \
    composer \
    nginx 

COPY ./etc/php/7.2/ /etc/php/7.2/

COPY ./opt/ /opt/

COPY ./etc/nginx/sites-available/ /etc/nginx/sites-available/

RUN \
  cd /var/www/ \
  && wget https://github.com/magento/magento2/archive/2.3.4.tar.gz \
  && tar -xf 2.3.4.tar.gz \
  && mv magento2-2.3.4 magento2 \
  && cd /var/www/magento2 \
  && composer install -v \
  && ln -s /etc/nginx/sites-available/magento /etc/nginx/sites-enabled/

ENTRYPOINT ["bash", "/opt/mage-run.sh"]
