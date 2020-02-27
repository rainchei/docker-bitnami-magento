FROM bitnami/magento

## Install packages
RUN install_packages vim

COPY --chown=bitnami:bitnami ./app/code/* /opt/bitnami/magento/htdocs/app/code/
COPY --chown=bitnami:bitnami ./app/etc/* /opt/bitnami/magento/htdocs/app/etc/

RUN \
  cd /opt/bitnami/magento/htdocs \
  && rm -rf ./generated/* ./var/view_preprocessed/* ./pub/static/* \
  && sed -i 's/memory_limit = 128M/memory_limit = 512M/g' /opt/bitnami/php/conf/php.ini \
  && php ./bin/magento setup:di:compile --no-ansi --no-interaction \
  && php ./bin/magento setup:static-content:deploy --no-ansi --no-interaction -f -s standard

COPY --chown=root:bitnami ./bin/ /opt/bin/

USER root

ENTRYPOINT ["/usr/local/bin/tini","-g","--","bash","/opt/bin/magento-run.sh"]
