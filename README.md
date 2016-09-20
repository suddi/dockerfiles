# docker-setup

[![license](https://img.shields.io/github/license/suddi/dockerfiles.svg?maxAge=2592000)](https://github.com/suddi/dockerfiles/blob/master/LICENSE)

Find the docker images at: https://hub.docker.com/u/suddi/

## Dockerfiles

### [suddi/worker](https://hub.docker.com/r/suddi/worker/)
[![suddi/worker](https://img.shields.io/docker/pulls/suddi/worker.svg)](https://hub.docker.com/r/suddi/worker/)

Provides node.js LTS version with `zint`, `libmcrypt` and the following node.js libraries:
* mocha
* grunt-cli
* bunyan

### [suddi/node](https://hub.docker.com/r/suddi/node/)
[![suddi/node](https://img.shields.io/docker/pulls/suddi/node.svg)](https://hub.docker.com/r/suddi/node/)

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
