#!/bin/sh

if [ -f /var/www/wordpress/index.php ]
then
  echo "wordpress already set up"
else
  curl https://ko.wordpress.org/latest-ko_KR.tar.gz -o wordpress.tar.gz
  tar -zxvf wordpress.tar.gz
  rm -rf wordpress.tar.gz
fi

exec "$@"
