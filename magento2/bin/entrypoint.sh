#!/bin/bash
set -eo pipefail

setenv() {
  MAGENTO_USER='gosu www-data:www-data'
  MAGENTO_ENVPHP='/etc/magento2/app/etc/env.php'
}

main() {
  cd $(dirname $0)
  setenv

  # TODO: dockerize env.php
  echo "Setting up env.php for magento2."
  ${MAGENTO_USER} cp ${MAGENTO_ENVPHP} ./app/etc/env.php

  echo "Starting php-fpm."
  exec /usr/sbin/php-fpm7.2
}

# ===

main
