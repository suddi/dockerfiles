FROM alpine:3.5

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL maintainer="Sudharshan Ravindran <mail@suddi.io>" \
      version="1.0" \
      description="node.js on alpine-linux" \
      link="https://hub.docker.com/r/suddi/node-alpine/"

# SET VARIABLES
ENV NODE_VERSION="6.9.5" \
    CONTAINER_USER="node" \
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

# INSTALL NODE
    curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz" && \
    tar -xf "node-v$NODE_VERSION.tar.xz" && \
    cd "node-v$NODE_VERSION" && \
    ./configure && \
    make -j$(getconf _NPROCESSORS_ONLN) && \
    make install && \
    cd .. && \
    rm -Rf "node-v$NODE_VERSION" && \
    rm "node-v$NODE_VERSION.tar.xz" && \

# REMOVE BUILD DEPENDENCIES
    apk del .build-deps

WORKDIR $HOME_DIR
# NOTE: REMEMBER TO SWITCH TO "node" USER IN EXTENDED DOCKERFILES
# ie. USER $USERNAME

CMD ["node"]
