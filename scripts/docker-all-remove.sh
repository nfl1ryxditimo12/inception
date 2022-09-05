#!/bin/bash

docker rm -f `docker ps -aq` && docker rmi -f `docker images -aq`

sudo rm -rf ~/data/*
mkdir ~/data/wordpress ~/data/mariadb

cache="cache"

if [ "$1" == "$cache" ]
then
  sudo docker system prune --volumes
fi
