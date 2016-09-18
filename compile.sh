#!/bin/sh

DOCKER_USER="suddi"

if [ -n "$1" ]; then
    DOCKER_IMAGE=$DOCKER_USER/$1
    docker build -t $DOCKER_IMAGE -f src/$1.Dockerfile .

    if [ -n "$2" ]; then
        docker tag $DOCKER_IMAGE $2
    fi

    docker push $DOCKER_IMAGE
else
    echo 'Dockerfile undefined'
fi
