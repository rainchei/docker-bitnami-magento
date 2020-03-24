#!/bin/bash
set -eo pipefail

main() {
  echo "Starting php-fpm."
  exec /usr/sbin/php-fpm7.2
}

# ===

main
