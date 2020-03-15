#!/bin/bash

setenv() {
  MAGENTO_ROOT='/var/www/magento2'
  MAGENTO_USER='gosu www-data:www-data'
  PHPFPM_LOG='/var/log/php7.2-fpm.log'
  NGINX_ERR_LOG='/var/log/nginx/error.log'
  SOCK='/run/php/php7.2-fpm.sock'
  WAIT='5'
}

main() {
  setenv

  echo "Starting php-fpm."
  service php7.2-fpm start

  while [ ! -S ${SOCK} ]
  do
    echo "${SOCK} does not exist! Retry in ${WAIT}s."
    sleep ${WAIT}
  done

  echo "Starting nginx."
  service nginx start

  [ -f ${PHPFPM_LOG} ] && tail -f ${PHPFPM_LOG} &
  [ -f ${NGINX_ERR_LOG} ] && tail -f ${NGINX_ERR_LOG} &
}

# ===

main
