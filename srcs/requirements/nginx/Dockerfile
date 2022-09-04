FROM alpine:3.16

WORKDIR /usr/src/app

RUN apk update && apk upgrade
RUN apk add nginx

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
