FROM alpine:3.16

# RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.16/community" >> /etc/apk/repositories
# RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update && apk upgrade
RUN apk add --no-cache mariadb mariadb-client openrc
# RUN mysql_install_db

# RUN adduser -D maria
# RUN mkdir /var/lib/mysql
# RUN chown root:root /var/lib/mysql

WORKDIR /usr/src/app

COPY ./tools/mariadb.sh .
# COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT [ "sh", "mariadb.sh" ]
# CMD [ "mysqld", "--user=seonkim" ]
