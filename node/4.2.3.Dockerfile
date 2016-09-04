FROM ubuntu:14.04

MAINTAINER Sudharshan Ravindran <suddir@gmail.com>

RUN apt-get update && apt-get install -y \
    wget

# CREATE NODE USER
RUN useradd --home /home/node -m -U -s /bin/bash node
USER node
WORKDIR /home/node

# INSTALL NVM, NODE AND NPM
ENV NODE_VERSION 4.2.3
ENV NVM_DIR /home/node/.nvm
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
RUN . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    npm install -g mocha grunt-cli bunyan nodemon repl.history pm2 --user "node"

CMD . /home/node/.nvm/nvm.sh && nvm use default
