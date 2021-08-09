DOCKER_COMPOSE_RUN := docker-compose run --rm
BUILD_VERSION := 0.0.1
ENVFILE := .env

build: .env
	$(DOCKER_COMPOSE_RUN) 3m make _build
.PHONY: build

_build: .env
	/usr/bin/docker build \
	  -t docker.io/whateverany/node-whateverany:$(BUILD_VERSION) \
	  -f src/Dockerfile  \
	  .
.PHONY: _build

shell: .env
	$(DOCKER_COMPOSE_RUN) 3m /bin/sh

.env:
	echo $(ENVFILE)
