#!/bin/bash

PHPFPM_SOCK='/var/run/php/php7.2-fpm.sock'
WAIT='5'

while [ ! -S ${PHPFPM_SOCK} ]; do
  echo "${PHPFPM_SOCK} not found! Retry in ${WAIT}s." >&2
  sleep ${WAIT}
done

echo "Starting nginx."
exec /usr/sbin/nginx -g 'daemon off;'
