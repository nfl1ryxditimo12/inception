#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

if [ ! -f /var/lib/mysql/mariadb_flag ]
then

  chown -R mysql:mysql /var/lib/mysql

  mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

  echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" > initial.sql
  echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> initial.sql
  echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%';" >> initial.sql
  echo "FLUSH PRIVILEGES;" >> initial.sql
  echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> initial.sql
  # echo "FLUSH PRIVILEGES;" >> initial.sql
  echo $(cat initial.sql)
  echo $(ls -al)

  touch /var/lib/mysql/mariadb_flag

  sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
  sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

  /usr/bin/mysqld --user=mysql --console --init-file=/usr/src/app/initial.sql
  
  # mysql -u root < /usr/asrc/app/initial.sql
else
  exec /usr/bin/mysqld --user=mysql --console
fi
