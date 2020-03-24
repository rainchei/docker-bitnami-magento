#!/bin/bash
set -eo pipefail

main() {
  cd $(dirname $0)

  echo "Starting php-fpm."
  exec /usr/sbin/php-fpm7.2
}

# ===

main
