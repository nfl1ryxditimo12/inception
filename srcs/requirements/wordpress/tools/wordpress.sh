#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ -f /var/www/wordpress/index.php ]
then
  echo "wordpress already set up"
else
  curl https://ko.wordpress.org/latest-ko_KR.tar.gz -o wordpress.tar.gz
  tar -zxvf wordpress.tar.gz
  rm -rf wordpress.tar.gz

  sed -i "s/'database_name_here'/'${WORDPRESS_DB_NAME}'/g" wordpress/wp-config-sample.php
  sed -i "s/'username_here'/'${WORDPRESS_DB_USER}'/g" wordpress/wp-config-sample.php
  sed -i "s/'password_here'/'${WORDPRESS_DB_PASSWORD}'/g" wordpress/wp-config-sample.php
  sed -i "s/'localhost'/'${WORDPRESS_DB_HOST}'/g" wordpress/wp-config-sample.php

  mv wordpress/wp-config-sample.php wordpress/wp-config.php

  mv wordpress/* /var/www/wordpress/
  rm -rf wordpress/

  wp db create
fi

exec "$@"
