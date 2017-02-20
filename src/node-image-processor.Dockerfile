FROM suddi/node-alpine:0.12.18

MAINTAINER Sudharshan Ravindran <mail@suddi.io>
LABEL version="1.0"
LABEL description="node.js v0.12.18 with image processing libs"
LABEL link="https://hub.docker.com/r/suddi/node-image-processor/"

# SET VARIABLES
ENV VIPS_VERSION 8.4.5

RUN \
# INSTALL BUILD DEPENDENCIES
	apk add --no-cache --virtual .build-deps \
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
	rm "vips-$VIPS_VERSION.tar.gz"

# NOTE: REMEMBER TO REMOVE BUILD DEPENDENCIES
# RUN apk del .build-deps
