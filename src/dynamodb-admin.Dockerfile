# BASE DOCKER IMAGE DOCKERFILE:
# https://github.com/suddi/dockerfiles/blob/8c72b1c089d1e801f0ddec1f6df207d7bbecaf92/src/node-alpine.Dockerfile
#
# docker build --tag suddi/dynamodb-admin --file src/dynamodb-admin.Dockerfile --build-arg NODE_VERSION=<NODE_VERSION> .
# docker push suddi/dynamodb-admin:<NODE_VERSION>
ARG NODE_VERSION="6.11.2"

FROM "suddi/node-alpine:$NODE_VERSION"

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL maintainer="Sudharshan Ravindran <mail@suddi.io>" \
      version="1.0" \
      description="node.js with dynamodb-admin alpine-linux" \
      link="https://hub.docker.com/r/suddi/dynamodb-admin/"

USER $CONTAINER_USER

RUN cd $HOME_DIR/app && \
    npm install bower && \
	npm install dynamodb-admin

WORKDIR $HOME_DIR/app
EXPOSE 8001
