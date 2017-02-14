FROM ubuntu:14.04

MAINTAINER Sudharshan Ravindran <suddir@gmail.com>
LABEL version="1.2"
LABEL description="node.js v6.9.1"
LABEL link="https://hub.docker.com/r/suddi/node/"

RUN apt-get update && apt-get install -y \
    wget

# CREATE NODE USER
RUN useradd --home /home/node -m -U -s /bin/bash node
USER node
WORKDIR /home/node

# INSTALL NVM, NODE AND NPM
ENV NODE_VERSION 6.9.1
ENV NVM_DIR /home/node/.nvm
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
RUN . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    npm install -g mocha grunt-cli bunyan nodemon repl.history pm2 --user "node"

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

CMD ['node']
