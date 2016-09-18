# docker-setup

Find the docker images at: https://hub.docker.com/u/suddi/

## Dockerfiles

### [suddi/worker](https://hub.docker.com/r/suddi/worker/)
[![Docker Pulls](https://img.shields.io/docker/pulls/suddi/worker.svg)](https://hub.docker.com/r/suddi/worker/)

Provides node.js LTS version with `zint`, `libmcrypt` and the following node.js libraries:
* mocha
* grunt-cli
* bunyan

### [suddi/node](https://hub.docker.com/r/suddi/node/)
[![Docker Pulls](https://img.shields.io/docker/pulls/suddi/node.svg)](https://hub.docker.com/r/suddi/node/)

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
source ./compile.sh worker
````

To pull a docker image from DockerHub:
````
source ./pull.sh worker
````

To run a docker image and enter:
````
source ./run.sh worker
````
