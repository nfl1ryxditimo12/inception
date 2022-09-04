FROM alpine:3.16

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.16/community" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update && apk upgrade
RUN apk add --update \
      curl \
      php8 \
      php8-fpm \
      php8-mysqli

WORKDIR /usr/src/app

COPY ./tools/wordpress.sh ./wordpress.sh
ENTRYPOINT [ "sh", "wordpress.sh" ]

EXPOSE 9000

CMD [ "php-fpm8", "--nodaemonize" ]
