FROM alpine:3.5

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL version="1.0"
LABEL description="Node.js v0.12.18"
LABEL link="https://hub.docker.com/r/suddi/node-alpine/"

# SET VARIABLES
ENV NODE_VERSION 0.12.18
ENV USERNAME node
ENV HOME /home/$USERNAME

RUN \
# INSTALL DEPENDENCIES
    apk add --no-cache --virtual .run-deps \
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

# CREATE NODE USER
    adduser -D -h $HOME -u 1000 $USERNAME && \
    cd $HOME && \

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

WORKDIR $HOME

CMD ["node"]
