# docker-setup

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/8c74c44bb93240d294a6c093f65c03ce)](https://www.codacy.com/app/suddir/dockerfiles?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=suddi/dockerfiles&amp;utm_campaign=Badge_Grade)
[![license](https://img.shields.io/github/license/suddi/dockerfiles.svg?maxAge=2592000)](https://github.com/suddi/dockerfiles/blob/master/LICENSE)

Find the docker images at: https://hub.docker.com/u/suddi/.

## Dockerfiles

---

### [suddi/node](https://hub.docker.com/r/suddi/node/)
[![suddi/node](https://img.shields.io/docker/pulls/suddi/node.svg)](https://hub.docker.com/r/suddi/node/)
[![microbadger/node](https://images.microbadger.com/badges/image/suddi/node.svg)](https://microbadger.com/images/suddi/node)

Provides node.js LTS versions on ubuntu.

#### Tags

[![](https://images.microbadger.com/badges/version/suddi/node:4.2.3.svg)](https://microbadger.com/images/suddi/node:4.2.3)
[![](https://images.microbadger.com/badges/version/suddi/node:4.5.0.svg)](https://microbadger.com/images/suddi/node:4.5.0)
[![](https://images.microbadger.com/badges/version/suddi/node:6.9.1.svg)](https://microbadger.com/images/suddi/node:6.9.1)
[![](https://images.microbadger.com/badges/version/suddi/node:6.9.5.svg)](https://microbadger.com/images/suddi/node:6.9.5)

---

### [suddi/worker](https://hub.docker.com/r/suddi/worker/)
[![suddi/worker](https://img.shields.io/docker/pulls/suddi/worker.svg)](https://hub.docker.com/r/suddi/worker/)
[![microbadger/worker](https://images.microbadger.com/badges/image/suddi/worker.svg)](https://microbadger.com/images/suddi/worker)

Provides node.js LTS versions with `zint`, `libmcrypt` and the following node.js libraries:
* `mocha`
* `grunt-cli`
* `bunyan`

#### Tags

[![](https://images.microbadger.com/badges/version/suddi/worker:4.5.0.svg)](https://microbadger.com/images/suddi/worker:4.5.0)
[![](https://images.microbadger.com/badges/version/suddi/worker:6.9.1.svg)](https://microbadger.com/images/suddi/worker:6.9.1)
[![](https://images.microbadger.com/badges/version/suddi/worker:6.9.5.svg)](https://microbadger.com/images/suddi/worker:6.9.5)

---

### [suddi/node-alpine](https://hub.docker.com/r/suddi/node-alpine/)
[![suddi/node-alpine](https://img.shields.io/docker/pulls/suddi/node-alpine.svg)](https://hub.docker.com/r/suddi/node-alpine/)
[![microbadger/worker](https://images.microbadger.com/badges/image/suddi/node-alpine.svg)](https://microbadger.com/images/suddi/node-alpine)

Provides node.js LTS versions on alpine-linux.

#### Tags

[![](https://images.microbadger.com/badges/version/suddi/node-alpine:0.12.18.svg)](https://microbadger.com/images/suddi/node-alpine:0.12.18)
[![](https://images.microbadger.com/badges/version/suddi/node-alpine:4.7.3.svg)](https://microbadger.com/images/suddi/node-alpine:4.7.3)
[![](https://images.microbadger.com/badges/version/suddi/node-alpine:6.9.5.svg)](https://microbadger.com/images/suddi/node-alpine:6.9.5)

---

### [suddi/node-image-processor](https://hub.docker.com/r/suddi/node-image-processor/)
[![suddi/node-image-processor](https://img.shields.io/docker/pulls/suddi/node-image-processor.svg)](https://hub.docker.com/r/suddi/node-image-processor/)
[![](https://images.microbadger.com/badges/image/suddi/node-image-processor.svg)](https://microbadger.com/images/suddi/node-image-processor)

Provides node.js LTS versions on alpine-linux with the following image-processing libraries installed:
* `libpng`
* `libjpeg`
* `sharp`

#### Tags

[![](https://images.microbadger.com/badges/version/suddi/node-image-processor:0.12.18.svg)](https://microbadger.com/images/suddi/node-image-processor:0.12.18)
[![](https://images.microbadger.com/badges/version/suddi/node-image-processor:4.7.3.svg)](https://microbadger.com/images/suddi/node-image-processor:4.7.3)

---

### [suddi/node-image-webpack-loader](https://hub.docker.com/r/suddi/node-image-webpack-loader/)
[![suddi/node-image-webpack-loader](https://img.shields.io/docker/pulls/suddi/node-image-webpack-loader.svg)](https://hub.docker.com/r/suddi/node-image-webpack-loader/)
[![](https://images.microbadger.com/badges/image/suddi/node-image-webpack-loader.svg)](https://microbadger.com/images/suddi/node-image-webpack-loader)

Provides node.js LTS versions on alpine-linux with image-processing libraries for `image-webpack-loader`.

#### Tags

[![](https://images.microbadger.com/badges/version/suddi/node-image-webpack-loader:4.7.3.svg)](https://microbadger.com/images/suddi/node-image-webpack-loader:4.7.3)

---

### [suddi/node-compass](https://hub.docker.com/r/suddi/node-compass/)
[![suddi/node-compass](https://img.shields.io/docker/pulls/suddi/node-compass.svg)](https://hub.docker.com/r/suddi/node-compass/)
[![](https://images.microbadger.com/badges/image/suddi/node-compass.svg)](https://microbadger.com/images/suddi/node-compass)

Provides node.js LTS versions on alpine-linux with `compass` installed.

#### Tags

[![](https://images.microbadger.com/badges/version/suddi/node-compass:4.7.3.svg)](https://microbadger.com/images/suddi/node-compass:4.7.3)

---

### [suddi/dynamodb-admin](https://hub.docker.com/r/suddi/dynamodb-admin/)
[![suddi/dynamodb-admin](https://img.shields.io/docker/pulls/suddi/dynamodb-admin.svg)](https://hub.docker.com/r/suddi/dynamodb-admin/)
[![](https://images.microbadger.com/badges/image/suddi/dynamodb-admin.svg)](https://microbadger.com/images/suddi/dynamodb-admin)

Provides admin GUI web interface through [`dynamodb-admin`](https://www.npmjs.com/package/dynamodb-admin) for `DynamoDB` on node.js v6.9.5.

#### Tags

[![](https://images.microbadger.com/badges/version/suddi/dynamodb-admin.svg)](https://microbadger.com/images/suddi/dynamodb-admin)

---

### [suddi/python-alpine](https://hub.docker.com/r/suddi/python-alpine/)
[![suddi/python-alpine](https://img.shields.io/docker/pulls/suddi/python-alpine.svg)](https://hub.docker.com/r/suddi/python-alpine/)
[![](https://images.microbadger.com/badges/image/suddi/python-alpine.svg)](https://microbadger.com/images/suddi/python-alpine)

Provides python on alpine-linux with the following libraries installed:
* `libmemcached`
* `libjpeg`
* `mysql`

#### Tags

[![](https://images.microbadger.com/badges/version/suddi/python-alpine:2.7.13.svg)](https://microbadger.com/images/suddi/python-alpine:2.7.13)

---

### [suddi/dynamodb-local-cloudformation](https://hub.docker.com/r/suddi/dynamodb-local-cloudformation/)
[![suddi/dynamodb-local-cloudformation](https://img.shields.io/docker/pulls/suddi/dynamodb-local-cloudformation.svg)](https://hub.docker.com/r/suddi/dynamodb-local-cloudformation/)
[![](https://images.microbadger.com/badges/image/suddi/dynamodb-local-cloudformation.svg)](https://microbadger.com/images/suddi/dynamodb-local-cloudformation)

Parse CloudFormation templates to create tables in DynamoDB Local using the Python library: [dynamodb-local-cloud-formation](https://github.com/steven-bruce-au/dynamodb-local-cloud-formation).

#### Tags

[![](https://images.microbadger.com/badges/version/suddi/dynamodb-local-cloudformation.svg)](https://microbadger.com/images/suddi/dynamodb-local-cloudformation)

---
