PWD := $(shell pwd)

DOCKER_COMPOSE:=docker-compose -f $(PWD)/docker-compose.yaml

.EXPORT_ALL_VARIABLES:
CID=$(shell basename $(PWD) | tr -cd '[:alnum:]' | tr A-Z a-z)
UID=$(shell id -u)
GID=$(shell id -g)

.PHONY: all

all: clean
	$(DOCKER_COMPOSE) stop
	$(DOCKER_COMPOSE) up --build --no-start
	$(DOCKER_COMPOSE) up -d  "appimage"
	$(DOCKER_COMPOSE) run    "appimage" make all
	$(DOCKER_COMPOSE) run    "appimage" chown -R $(UID):$(GID) ./
	$(DOCKER_COMPOSE) stop

clean:
	$(DOCKER_COMPOSE) up -d  "appimage"
	$(DOCKER_COMPOSE) run    "appimage" make clean
	$(DOCKER_COMPOSE) rm --stop --force
