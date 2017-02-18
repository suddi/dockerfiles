FROM ubuntu:14.04

MAINTAINER Sudharshan Ravindran <suddir@gmail.com>
LABEL version="1.3"
LABEL description="node.js v0.12.18"
LABEL link="https://hub.docker.com/r/suddi/node/"

# SET VARIABLES
ENV NODE_VERSION 0.12.18
ENV USERNAME node
ENV HOME /home/$USERNAME
ENV NVM_DIR $HOME/.nvm
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# INSTALL NVM, NODE AND NPM
RUN \
	apt-get update && \
	apt-get install --assume-yes \
		wget && \

	# CREATE NODE USER
	useradd --home $HOME --create-home --user-group --uid 1000 --shell /bin/bash $USERNAME && \
	cd $HOME && \

	# INSTALL NVM, NODE AND NPM
	wget --quiet --output-document - https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash && \
	. $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION

WORKDIR $HOME

CMD ['node']
