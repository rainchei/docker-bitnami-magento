#!/bin/bash

main() {
  PHPFPM_LOG='/var/log/php7.2-fpm.log'
  echo "Starting php-fpm."
  service php7.2-fpm start

  SOCK='/run/php/php7.2-fpm.sock'
  WAIT='5'
  while [ ! -S ${SOCK} ]
  do
    echo "${SOCK} does not exist! Retry in ${WAIT}s."
    sleep ${WAIT}
  done

  service nginx start
  [ -f ${PHP_LOG} ] && tail -f ${PHP_LOG}
}

# ===

main
