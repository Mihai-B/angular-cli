FROM node:14.1-alpine

LABEL authors="Alejandro Such <alejandro.such@gmail.com> , Mihai Bob <mihai.m.bob@gmail.com>"

RUN apk update \
  && apk add --update alpine-sdk python git \
  && npm install -g @angular/cli@9.1.4 \
  && apk del alpine-sdk python \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache clean --force \
  && yarn cache clean \
&& sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd
