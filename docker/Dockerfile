FROM --platform=linux/amd64 node:16-alpine

WORKDIR /app

COPY ./entrypoint.sh /entrypoint.sh
COPY ./install-packages.sh /usr/local/bin/install-packages
RUN apk update \
  && INSTALL_VERSION=$VERSION install-packages \
  && rm /usr/local/bin/install-packages;

ENTRYPOINT ["/entrypoint.sh"]
CMD ["server"]
