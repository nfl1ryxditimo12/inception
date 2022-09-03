FROM alpine:3.16

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.16/community" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add --update \
      curl \
      php8-fpm \
      php8-mysqli

WORKDIR /usr/src/app

RUN curl https://ko.wordpress.org/latest-ko_KR.tar.gz -o wordpress.tar.gz
RUN tar -zxvf wordpress.tar.gz

EXPOSE 9000

CMD [ "php-fpm8", "--nodaemonize" ]
