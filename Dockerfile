FROM bitnami/magento

## Install packages
RUN install_packages vim

USER root

COPY --chown=bitnami:bitnami ./app/code/* /opt/bitnami/magento/htdocs/app/code/

RUN \
  cd /opt/bitnami/magento/htdocs \
  && rm -rf ./generated/* ./var/view_preprocessed/* ./pub/static/* \
  && ./bin/magento deploy:mode:set production \
  && ./bin/magento setup:di:compile --no-ansi --no-interaction \
  && ./bin/magento setup:static-content:deploy --no-ansi --no-interaction -f -s standard

COPY --chown=root:app ./bin/ /opt/bin/

#USER root

#ENTRYPOINT ["bash","/opt/bin/magento-run.sh"]
