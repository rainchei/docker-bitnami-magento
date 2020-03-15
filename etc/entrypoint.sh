#!/bin/bash
service nginx start
exec /usr/sbin/php-fpm7.2
