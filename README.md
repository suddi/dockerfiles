# docker-setup

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/8c74c44bb93240d294a6c093f65c03ce)](https://www.codacy.com/app/suddir/dockerfiles?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=suddi/dockerfiles&amp;utm_campaign=Badge_Grade)
[![license](https://img.shields.io/github/license/suddi/dockerfiles.svg?maxAge=2592000)](https://github.com/suddi/dockerfiles/blob/master/LICENSE)


Find the docker images at: https://hub.docker.com/u/suddi/

## Dockerfiles

### [suddi/worker](https://hub.docker.com/r/suddi/worker/)
[![suddi/worker](https://img.shields.io/docker/pulls/suddi/worker.svg)](https://hub.docker.com/r/suddi/worker/)
[![microbadger/worker](https://images.microbadger.com/badges/image/suddi/worker.svg)](https://microbadger.com/images/suddi/worker)

Provides node.js LTS version with `zint`, `libmcrypt` and the following node.js libraries:
* mocha
* grunt-cli
* bunyan

### [suddi/node](https://hub.docker.com/r/suddi/node/)
[![suddi/node](https://img.shields.io/docker/pulls/suddi/node.svg)](https://hub.docker.com/r/suddi/node/)
[![microbadger/node](https://images.microbadger.com/badges/image/suddi/node.svg)](https://microbadger.com/images/suddi/node)

Provides node.js LTS version with some commonly used node.js libraries:
* mocha
* grunt-cli
* bunyan
* nodemon
* repl.history
* pm2

## Usage

To compile and push one of the docker images found in `src/`, eg. `worker`:

````
./actions.sh compile node 4.5.0
````

To pull a docker image from DockerHub:
````
./actions.sh pull node
````

To run a docker image and enter:
````
./actions.sh run node
````
