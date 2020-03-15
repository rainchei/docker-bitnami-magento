#!/bin/bash
service nginx start
exec /usr/sbin/php7.2-fpm
