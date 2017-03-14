# BASE DOCKER IMAGE DOCKERFILE:
# https://github.com/suddi/dockerfiles/blob/8c72b1c089d1e801f0ddec1f6df207d7bbecaf92/src/node-alpine.Dockerfile
FROM suddi/node-alpine:6.9.5

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL maintainer="Sudharshan Ravindran <mail@suddi.io>" \
      version="1.0" \
      description="node.js with dynamodb-admin alpine-linux" \
      link="https://hub.docker.com/r/suddi/dynamodb-admin/"

USER $CONTAINER_USER

RUN cd $HOME_DIR/app && \
	npm install dynamodb-admin

WORKDIR $HOME_DIR/app
EXPOSE 8001
