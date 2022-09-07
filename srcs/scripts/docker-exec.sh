#!/bin/zsh

if [ ! $# -eq 0 ]
then
    ps=`docker ps | grep srcs-$1`

    container=$(echo ${ps:0:12})

    docker exec -it $container sh
fi
