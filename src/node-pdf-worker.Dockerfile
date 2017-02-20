FROM suddi/node:6.9.5

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL version="1.3"
LABEL description="node.js v6.9.5 with PDF worker config"
LABEL link="https://hub.docker.com/r/suddi/worker/"

RUN \
# PACKAGE MANAGER INSTALLATIONS
    echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
        librsvg2-bin \
        poppler-utils \
        build-essential \
        ubuntu-restricted-extras \
        libpng12-dev \
        cmake \
        wget \
        git && \

# INSTALL ZINT
    wget http://ncu.dl.sourceforge.net/project/zint/zint/2.4.3/zint-2.4.3.tar.gz && \
    mkdir zint/ && \
    tar -xvzf zint-2.4.3.tar.gz -C ./zint/ --strip-components=1 && \
    cd ./zint && mkdir -p ./build && cd ./build && cmake .. && make && \
    make install && \
    cd ../../ && \
    rm -rf zint/ zint-2.4.3.tar.gz && \

# INSTALL LIBMCRYPT
    wget http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz && \
    mkdir libmcrypt/ && \
    tar -xvzf libmcrypt-2.5.8.tar.gz -C ./libmcrypt/ --strip-components=1 && \
    cd libmcrypt && ./configure && make && \
    make install && \
    cd ../ && \
    rm -rf libmcrypt/ libmcrypt-2.5.8.tar.gz && \
    echo "/usr/local/lib" >> /etc/ld.so.conf.d/usr-local.conf && ldconfig && \

# INSTALL NECESSARY GLOBAL NPM PACKAGES
    npm install -g mocha grunt-cli bunyan --user "node"

USER $USERNAME
