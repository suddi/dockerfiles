FROM ubuntu:14.04

MAINTAINER Sudharshan Ravindran <suddi@gmail.com>
LABEL version="1.1"
LABEL description="node.js v4.5.0 with PDF worker config"
LABEL link="https://hub.docker.com/r/suddi/worker/"

# PACKAGE MANAGER INSTALLATIONS
RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    librsvg2-bin \
    poppler-utils \
    build-essential \
    ubuntu-restricted-extras \
    libpng12-dev \
    cmake \
    wget \
    git

# INSTALL ZINT
RUN wget http://ncu.dl.sourceforge.net/project/zint/zint/2.4.3/zint-2.4.3.tar.gz && \
    mkdir zint/ && \
    tar -xvzf zint-2.4.3.tar.gz -C ./zint/ --strip-components=1 && \
    cd ./zint && mkdir -p ./build && cd ./build && cmake .. && make && \
    make install && \
    cd ../../ && \
    rm -rf zint/ zint-2.4.3.tar.gz

# INSTALL LIBMCRYPT
RUN wget http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz && \
    mkdir libmcrypt/ && \
    tar -xvzf libmcrypt-2.5.8.tar.gz -C ./libmcrypt/ --strip-components=1 && \
    cd libmcrypt && ./configure && make && \
    make install && \
    cd ../ && \
    rm -rf libmcrypt/ libmcrypt-2.5.8.tar.gz
RUN echo "/usr/local/lib" >> /etc/ld.so.conf.d/usr-local.conf && ldconfig

# CREATE NODE USER
RUN useradd --home /home/node -m -U -s /bin/bash node
USER node
WORKDIR /home/node

# INSTALL NVM, NODE AND NPM
ENV NODE_VERSION 4.5.0
ENV NVM_DIR /home/node/.nvm
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
RUN . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    npm install -g mocha grunt-cli bunyan --user "node"
