# BASE DOCKER IMAGE DOCKERFILE:
# https://github.com/gliderlabs/docker-alpine/blob/c584d0198d5dea1c5d942e1e1a7b2504ecdb4d30/versions/library-3.5/Dockerfile
#
# docker build --tag suddi/node-alpine:<NODE_VERSION> --file node-alpine.Dockerfile --build-arg NODE_VERSION=<NODE_VERSION> .
# docker push suddi/node-alpine:<NODE_VERSION>
FROM alpine:3.5

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL maintainer="Sudharshan Ravindran <mail@suddi.io>" \
      version="1.0" \
      description="node.js on alpine-linux" \
      link="https://hub.docker.com/r/suddi/node-alpine/"

ARG NODE_VERSION="6.9.5"

# SET VARIABLES
ENV CONTAINER_USER="node" \
    HOME_DIR="/home/node"

# INSTALL RUNTIME DEPENDENCIES
RUN apk add --no-cache --virtual .run-deps \
        libstdc++ && \

# INSTALL BUILD DEPENDENCIES
    apk add --no-cache --virtual .build-deps \
        binutils-gold \
        curl \
        g++ \
        gcc \
        gnupg \
        libgcc \
        linux-headers \
        make \
        python && \

# INSTALL DEVELOPMENT DEPENDENCIES
    apk add --no-cache --virtual .dev-deps \
        git \
        openssh && \

# CREATE NODE USER
    adduser -D -h $HOME_DIR -u 1000 $CONTAINER_USER && \
    cd $HOME_DIR && \
    mkdir $HOME_DIR/app && \
    chown -R $CONTAINER_USER:$CONTAINER_USER $HOME_DIR && \

# GPG KEYS LISTED AT https://github.com/nodejs/node#release-team
    for KEY in \
        9554F04D7259F04124DE6B476D5A82AC7E37093B \
        94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
        FD3A5288F042B6850C66B31F09FE44734EB7990E \
        71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
        DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
        B9AE9905FFD7803F25714661B63B535A4C206CA9 \
        C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
        56730D5401028683275BD23C23EFEFE93C4CFFFE ; \
    do \
        gpg --keyserver pgp.mit.edu --recv-keys "$KEY" || \
        gpg --keyserver keyserver.pgp.com --recv-keys "$KEY" || \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$KEY" ; \
    done && \

# INSTALL NODE
    curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz" && \
    curl -SLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" && \
    gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc && \
    grep " node-v$NODE_VERSION.tar.xz\$" SHASUMS256.txt | sha256sum -c - && \
    tar -xf "node-v$NODE_VERSION.tar.xz" && \
    cd "node-v$NODE_VERSION" && \
    ./configure && \
    make -j$(getconf _NPROCESSORS_ONLN) && \
    make install && \
    cd .. && \
    rm -Rf "node-v$NODE_VERSION" && \
    rm "node-v$NODE_VERSION.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt && \

# REMOVE BUILD DEPENDENCIES
    apk del .build-deps

WORKDIR $HOME_DIR
# NOTE: REMEMBER TO SWITCH TO "node" USER IN EXTENDED DOCKERFILES OR IN DOCKER-COMPOSE

CMD ["node"]
