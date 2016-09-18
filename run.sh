#!/bin/sh

docker_user="suddi"

if [ -n "$1" ]; then
    docker_image=$docker_user/$1
    docker run -it $docker_image /bin/bash
else
    echo 'ERROR: Docker image undefined'
fi
