FROM alpine:3.16

RUN apk update && apk upgrade
RUN apk add nginx openssl

RUN mkdir /etc/nginx/ssl

WORKDIR /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
          -out /etc/nginx/ssl/inception.pem \
          -keyout /etc/nginx/ssl/inception.key \
          -subj "/C=KO/ST=Seoul/L=Seoul/O=42Seoul/OU=inception/CN=inception/"

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
