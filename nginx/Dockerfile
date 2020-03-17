FROM nginx:1.17.9

ENV PHP_VERSION=7.2 \
    TINI_VERSION=v0.18.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini

RUN \
  chmod +x /usr/bin/tini

COPY ./etc/ /etc/

# ---

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]

CMD ["bash", "-c", "/etc/entrypoint.sh"]
