#!/bin/bash

cd /opt/bitnami/magento/htdocs

php ./bin/magento deploy:mode:set production --skip-compilation --no-interaction
