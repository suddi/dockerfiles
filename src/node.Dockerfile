FROM ubuntu:14.04

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL version="1.3"
LABEL description="node.js v6.9.5"
LABEL link="https://hub.docker.com/r/suddi/node/"

# SET VARIABLES
ENV NODE_VERSION 6.9.5
ENV USERNAME node
ENV HOME /home/$USERNAME
ENV NVM_DIR $HOME/.nvm
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN \
# INSTALL NVM, NODE AND NPM
	apt-get update && \
	apt-get install --assume-yes \
		wget && \

# CREATE NODE USER
	useradd --home $HOME --create-home --user-group --uid 1000 --shell /bin/bash $USERNAME && \
	cd $HOME && \

# INSTALL NVM, NODE AND NPM
	wget --quiet --output-document - \
		https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash && \
	. $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \

# CHANGE OWNERSHIP TO "node" USER
    chown -R $USERNAME:$USERNAME $HOME

WORKDIR $HOME

# NOTE: REMEMBER TO SWITCH TO "node" USER IN EXTENDED DOCKERFILES
# ie. USER $USERNAME

CMD ['node']
