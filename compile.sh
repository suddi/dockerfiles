#!/bin/sh

docker_user="suddi"

if [ -n "$1" ]; then
    docker_image=$docker_user/$1
    docker build -t $docker_image -f src/$1.Dockerfile .

    if [ -n "$2" ]; then
        docker tag $docker_image $2
    fi

    docker push $docker_image
else
    echo 'ERROR: Docker image undefined'
fi
