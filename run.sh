#!/bin/sh

DOCKER_USER="suddi"

if [ -n "$1" ]; then
    DOCKER_IMAGE=$DOCKER_USER/$1
    docker run -it $DOCKER_IMAGE /bin/bash
else
    echo 'Docker image undefined'
fi
