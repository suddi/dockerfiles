# BASE DOCKER IMAGE DOCKERFILE:
# https://github.com/docker-library/python/blob/ad4706ad7d23ef13472d2ee340aa43f3b9573e3d/2.7/alpine/Dockerfile
#
# docker build --tag suddi/python:<PYTHON_VERSION>-alpine --file src/python-alpine.Dockerfile --build-arg PYTHON_VERSION=<PYTHON_VERSION> .
# docker push suddi/python-alpine:<PYTHON_VERSION>
ARG PYTHON_VERSION="2.7.13"

FROM "python:$PYTHON_VERSION-alpine"

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL maintainer="Sudharshan Ravindran <mail@suddi.io>" \
      version="1.0" \
      description="runs dynamodb-local-cloudformation parser on alpine-linux" \
      link="https://hub.docker.com/r/suddi/python-dynamodb-local-cloudformation/"

# SET VARIABLES
ENV CONTAINER_USER="py" \
    HOME_DIR="/home/py"

# INSTALL BUILD DEPENDENCIES
RUN apk add --no-cache --virtual .build-deps \
        curl && \

# CREATE PY USER
    adduser -D -h $HOME_DIR -u 1000 $CONTAINER_USER && \
    cd $HOME_DIR && \

# CLONE dynamodb-local-cloud-formation
    curl -SLO "https://github.com/steven-bruce-au/dynamodb-local-cloud-formation/archive/master.zip" && \
    unzip "master.zip" && \
    rm "master.zip" && \
    mv "dynamodb-local-cloud-formation-master" "dynamodb-local-cloudformation" && \
    mkdir $HOME_DIR/app && \

    pip install --no-cache-dir \
        awscli \
        pyyaml && \

    mkdir /root/.aws && \
    echo "[default]" > /root/.aws/credentials && \
    echo "aws_access_key_id = <ACCESS_KEY_ID>" >> /root/.aws/credentials && \
    echo "aws_secret_access_key = <SECRET_ACCESS_KEY>" >> /root/.aws/credentials && \

    chown -R $CONTAINER_USER:$CONTAINER_USER $HOME_DIR

# NOTE: REMEMBER TO REMOVE BUILD DEPENDENCIES
RUN apk del .build-deps

WORKDIR $HOME_DIR/app
