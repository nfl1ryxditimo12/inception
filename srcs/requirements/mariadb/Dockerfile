FROM alpine:3.15

RUN apk update && apk upgrade
RUN apk add --no-cache mariadb mariadb-client

WORKDIR /usr/src/app

COPY ./tools/mariadb.sh .

EXPOSE 3306

ENTRYPOINT [ "sh", "mariadb.sh" ]
