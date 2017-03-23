# BASE DOCKER IMAGE DOCKERFILE:
# https://github.com/suddi/dockerfiles/blob/49fc98812d64e4c3556f863d9c617c4bca6002a6/src/node-alpine.Dockerfile
FROM suddi/node-alpine:4.7.3

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL maintainer="Sudharshan Ravindran <mail@suddi.io>" \
      version="1.0" \
      description="node.js with image processing libs on alpine-linux" \
      link="https://hub.docker.com/r/suddi/node-image-processor/"

# SET VARIABLES
ENV VIPS_VERSION=8.4.5

# INSTALL BUILD DEPENDENCIES
RUN apk add --no-cache --virtual .build-deps \
		curl \
		g++ \
		gcc \
		make \
		libpng-dev \
		libwebp-dev \
		libexif-dev \
		libxml2-dev \
		libjpeg-turbo-dev && \

# INSTALL RUN DEPENDENCIES
	apk add --no-cache --virtual .run-deps \
		python \
		glib-dev \
		glib \
		libpng \
		libwebp \
		libexif \
		libxml2 \
		libjpeg-turbo && \

# INSTALL VIPS
	curl -SLO "http://www.vips.ecs.soton.ac.uk/supported/current/vips-$VIPS_VERSION.tar.gz" && \
	tar -xf "vips-$VIPS_VERSION.tar.gz" && \
	cd "vips-$VIPS_VERSION" && \
	./configure --without-gsf && \
	make -j$(getconf _NPROCESSORS_ONLN) && \
	make install && \
	cd .. && \
	rm -Rf "vips-$VIPS_VERSION" && \
	rm "vips-$VIPS_VERSION.tar.gz" && \

	curl -s https://raw.githubusercontent.com/lovell/sharp/v0.8.2/preinstall.sh | sh -

# NOTE: REMEMBER TO REMOVE BUILD DEPENDENCIES
# RUN apk del .build-deps
