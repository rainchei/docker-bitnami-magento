ARG MAGENTO_PHPFPM

ARG MAGENTO_BUSYBOX

ARG GITHUB_PAT

# ---

FROM $MAGENTO_PHPFPM AS built_contents

# Install magento2
RUN \
  mkdir -p /var/www \
  && cd /var/www \
  && wget https://github.com/magento/magento2/archive/2.3.4.tar.gz \
  && bsdtar -xf 2.3.4.tar.gz \
  && mv magento2-2.3.4 magento2 \
  && rm 2.3.4.tar.gz

# Generate codes and static contents
COPY ./magento2/ /var/www/magento2/

RUN \
  echo $GITHUB_PAT

RUN \
  cd /var/www/magento2 \
  && dockerize -template /var/www/magento2/composer.json.tmpl:./composer.json \
  && composer install -v \
  && ./bin/magento setup:di:compile --no-interaction --no-ansi \
  && ./bin/magento setup:static-content:deploy --no-interaction --no-ansi \
    --strategy=compact \
    -f \
  && chown -R www-data:www-data /var/www/magento2/

# Wrap-up
RUN \
  cd /var/www/magento2 \
  && bsdtar -cvzpf /var/www/mage2bak.tar.gz .

# ---

FROM $MAGENTO_BUSYBOX

COPY --from=built_contents /var/www/mage2bak.tar.gz /var/www/

