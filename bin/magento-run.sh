#!/bin/bash

cd /opt/bitnami/magento/htdocs/app/code/

php ./bin/magento deploy:mode:set production --skip-compilation --no-interaction
