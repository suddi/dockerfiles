# BASE DOCKER IMAGE DOCKERFILE:
# https://github.com/tianon/docker-brew-ubuntu-core/blob/b6f1fe19228e5b6b7aed98dcba02f18088282f90/trusty/Dockerfile
#
# docker build --tag suddi/node:<NODE_VERSION> --file node.Dockerfile --build-arg NODE_VERSION=<NODE_VERSION> .
# docker push suddi/node:<NODE_VERSION>
FROM ubuntu:14.04

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL maintainer="Sudharshan Ravindran <mail@suddi.io>" \
      version="1.3" \
      description="node.js on ubuntu" \
      link="https://hub.docker.com/r/suddi/node/"

ARG NODE_VERSION="6.11.2"

# SET VARIABLES
ENV CONTAINER_USER="node" \
	HOME_DIR="/home/node" \
	NVM_DIR="/home/node/.nvm"
ENV NODE_PATH="$NVM_DIR/v$NODE_VERSION/lib/node_modules" \
	PATH="$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH"

# INSTALL NVM, NODE AND NPM
RUN apt-get update && \
	apt-get install --assume-yes \
		wget && \

# CREATE NODE USER
	useradd --home $HOME_DIR --create-home --user-group --uid 1000 --shell /bin/bash $CONTAINER_USER && \
	cd $HOME_DIR && \
	mkdir $HOME_DIR/app && \

# INSTALL NVM, NODE AND NPM
	wget --quiet --output-document - \
		https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash && \
	. $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \

# CHANGE OWNERSHIP TO "node" USER
    chown -R $CONTAINER_USER:$CONTAINER_USER $HOME_DIR

WORKDIR $HOME_DIR
# NOTE: REMEMBER TO SWITCH TO "node" USER IN EXTENDED DOCKERFILES
# ie. USER $USERNAME

CMD ["node"]
