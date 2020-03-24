#!/bin/bash
set -eo pipefail

setenv() {
  MAGE_ROOT='/var/www/html'
}

mage_conf() {
  cd ${MAGE_ROOT}

  echo "Setting up env.php for magento2."
  dockerize -delims "<%:%>" -template ${MAGE_ROOT}/app/etc/env.php.tmpl:./app/etc/env.php \
  && chown www-data:www-data ./app/etc/env.php

  # setup upgrade
  gosu www-data:www-data ./bin/magento setup:upgrade --keep-generated --no-interaction
}

# ===

main() {
  setenv
  echo "== Initializing Magento2."
  mage_conf
}

main
