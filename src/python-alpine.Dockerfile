# BASE DOCKER IMAGE DOCKERFILE:
# https://github.com/docker-library/python/blob/ad4706ad7d23ef13472d2ee340aa43f3b9573e3d/2.7/alpine/Dockerfile
#
# docker build --tag suddi/python:2.7.13-alpine --file python-alpine.Dockerfile --build-arg PYTHON_VERSION=<PYTHON_VERSION> .
# docker push suddi/python-alpine:<PYTHON_VERSION>
ARG PYTHON_VERSION="2.7.13"

FROM "python:$PYTHON_VERSION-alpine"

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL maintainer="Sudharshan Ravindran <mail@suddi.io>" \
      version="1.0" \
      description="python on alpine-linux" \
      link="https://hub.docker.com/r/suddi/python-alpine/"

# SET VARIABLES
ENV CONTAINER_USER="py" \
    HOME_DIR="/home/py" \
    LIBRARY_PATH="/lib:/usr/lib"

# INSTALL BUILD DEPENDENCIES
RUN apk add --no-cache --virtual .build-deps \
        gcc \
        g++ \
        git \
        make \
        libjpeg-turbo-dev \
        libmemcached-dev \
        zlib-dev \
        zlib \
        libffi-dev \
        cyrus-sasl-dev && \

# INSTALL RUN DEPENDENCIES
    apk add --no-cache --virtual .run-deps \
        mysql-dev \
        libmagic \
        libjpeg-turbo \
        libmemcached && \

# CREATE PY USER
    adduser -D -h $HOME_DIR -u 1000 $CONTAINER_USER && \
    cd $HOME_DIR && \
    mkdir $HOME_DIR/app && \

    chown -R $CONTAINER_USER:$CONTAINER_USER $HOME_DIR && \

    pip install --no-cache-dir fabric django-sslserver==0.15

# NOTE: REMEMBER TO REMOVE BUILD DEPENDENCIES
# RUN apk del .build-deps

WORKDIR $HOME_DIR
