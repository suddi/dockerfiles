# docker-setup

Dockerfiles for setting up Node.js workers making use of PDF generation libraries: zint.

Find the docker images at: https://hub.docker.com/u/suddi/

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
