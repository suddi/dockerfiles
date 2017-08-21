# BASE DOCKER IMAGE DOCKERFILE:
# https://github.com/suddi/dockerfiles/blob/8c72b1c089d1e801f0ddec1f6df207d7bbecaf92/src/node-alpine.Dockerfile
#
# docker build --tag suddi/node-compass:<NODE_VERSION> --file src/node-compass.Dockerfile --build-arg NODE_VERSION=<NODE_VERSION> .
# docker push suddi/node-compass:<NODE_VERSION>
ARG NODE_VERSION="6.9.5"

FROM "suddi/node-alpine:$NODE_VERSION"

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL maintainer="Sudharshan Ravindran <mail@suddi.io>" \
      version="1.0" \
      description="node.js with dynamodb-admin alpine-linux" \
      link="https://hub.docker.com/r/suddi/dynamodb-admin/"

RUN apk add --no-cache --virtual .run-deps \
		ruby && \

    apk add --no-cache --virtual .build-deps \
		g++ \
		gcc \
		make \
		ruby-dev \
		libffi-dev \
		ruby-rdoc \
		ruby-irb && \

    gem install compass

# NOTE: REMEMBER TO REMOVE BUILD DEPENDENCIES
# RUN apk del .build-deps
