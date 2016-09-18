#!/bin/sh

DOCKER_USER="suddi"

if [ -n "$1" ]; then
    DOCKER_IMAGE=$DOCKER_USER/$1
    docker pull $DOCKER_IMAGE
else
    echo 'Docker image undefined'
fi
