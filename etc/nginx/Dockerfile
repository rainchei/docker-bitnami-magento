FROM nginx:1.17.9

ENV PHP_VERSION=7.2 \
    TINI_VERSION=v0.18.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini

RUN \
  chmod +x /usr/bin/tini

# Post install
COPY ./etc/ /etc/

WORKDIR /etc/nginx

# ---

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]

CMD ["bash", "entrypoint.sh"]
