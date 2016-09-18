#!/bin/sh

docker_user="suddi"

if [ -n "$1" ]; then
    docker_image=$docker_user/$1
    docker pull $docker_image
else
    echo 'ERROR: Docker image undefined'
fi
