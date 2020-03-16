FROM ubuntu:18.04

RUN \
  ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime \
  && apt-get -y clean \
  && apt-get -y update \
  && apt-get -y upgrade \
  && apt-get install -y \
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

COPY ./etc/entrypoint.sh /etc/entrypoint.sh

COPY ./etc/nginx/sites-available/ /etc/nginx/sites-available/


# Install magento2
RUN \
  cd /var/www/ \
  && wget https://github.com/magento/magento2/archive/2.3.4.tar.gz \
  && tar -xf 2.3.4.tar.gz \
  && mv magento2-2.3.4 magento2 \

COPY ./magento2/ /var/www/magento2/

# Post Install
RUN \
  cd /var/www/magento2 \
  && composer install -v \
  && ./bin/magento setup:install --no-interaction \
    --base-url=http://localhost/magento2/ \
    --db-host=127.0.0.1 \
    --db-name=magento \
    --db-user=root \
    --db-password=root \
    --admin-firstname=Magento \
    --admin-lastname=User \
    --admin-email=user@example.com \
    --admin-user=admin \
    --admin-password=admin123 \
    --language=en_US \
    --currency=USD \
    --timezone=UTC \
    --use-rewrites=1 \
    --backend-frontname=admin_portal \
  && ./bin/magento deploy:mode:set production \
    --no-interaction --skip-compilation \
  && ./bin/magento setup:di:compile --no-interaction --no-ansi \
  && ./bin/magento setup:static-content:deploy --no-interaction --no-ansi \
    --strategy=compact

RUN \
  ln -s /etc/nginx/sites-available/magento /etc/nginx/sites-enabled/ \
  && chown -R www-data:www-data /var/www/magento2/

EXPOSE 80 443

CMD ["bash", "/etc/entrypoint.sh"]
