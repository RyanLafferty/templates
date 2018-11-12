# Windows Dependant Variables
ifeq ($(OS),Windows_NT)
echo 'Error: Windows is currently not supported'
else
    UNAME_S := $(shell uname -s)
    UID := $(shell id -u $$(whoami))

    # OS X Dependant Variables
    ifeq ($(UNAME_S), Darwin)

    INSTALL_COMMAND := sh scripts/macos-install-latest-docker.sh
    UP_COMMAND := open -a Docker

    # GNU/Linux Depedant Variables
    else ifeq ($(UNAME_S), Linux)

    INSTALL_COMMAND := sh scripts/ubuntu-install-latest-docker.sh

    endif
endif

# Docker Commands
DOCKER_COMMAND := docker
DOCKER_SWARM_COMMAND := docker swarm
DOCKER_COMPOSE_COMMAND := docker-compose

# Docker Config
COMPOSE_FILE := docker-compose.yml
LOCAL_IMAGE_NAME := express-app
STACK_NAME := stack
REG_PUBLISHED_PORT := 5000
REG_SERVICE_PORT := 5000

# Containers
LOCAL_CONTAINER_NAME := express-app
LOCAL_DB_CONTAINER_NAME := express-db

# Test DB Auth - DO NOT USE REAL AUTH
LOCAL_DB_USER := root
LOCAL_DB_PASS := root
LOCAL_DB_NAME := inventory


# Environment
.PHONY: install hooks docker-clean docker-destroy

install:
	$(INSTALL_COMMAND)
hooks:
	cp hooks/* .git/hooks/
docker-clean:
	sh scripts/docker-cleanup.sh
docker-destroy:
	sh scripts/docker-destroy.sh

# Application
.PHONY: up start stop ssh build reup

up:
	$(UP_COMMAND)
	$(DOCKER_COMPOSE_COMMAND) up
start:
	$(DOCKER_COMPOSE_COMMAND) start
stop:
	$(DOCKER_COMPOSE_COMMAND) stop
ssh:
	$(DOCKER_COMMAND) exec -it $(LOCAL_CONTAINER_NAME) /bin/bash
build:
	$(DOCKER_COMPOSE_COMMAND) build
reup: build up

# Database
.PHONY: backup-db restore-db destroy-db

backup-db:
	sh scripts/db-backup.sh $(LOCAL_DB_CONTAINER_NAME) $(LOCAL_DB_USER) $(LOCAL_DB_PASS) $(LOCAL_DB_NAME)
restore-db:
	sh scripts/db-restore.sh $(LOCAL_DB_CONTAINER_NAME) $(LOCAL_DB_USER) $(LOCAL_DB_PASS) $(LOCAL_DB_NAME)
destroy-db:
	sh scripts/db-destroy.sh $(LOCAL_DB_CONTAINER_NAME) $(LOCAL_DB_USER) $(LOCAL_DB_PASS) $(LOCAL_DB_NAME)

# Docker Swarm Cluster Service
.PHONY: init-swarm leave-swarm
.PHONY: create-container-registry destroy-container-registry
.PHONY: configure-environment destroy-environment

init-swarm:
	$(DOCKER_SWARM_COMMAND) init
create-container-registry:
	$(DOCKER_COMMAND) service create --name registry --publish published=$(REG_PUBLISHED_PORT),target=$(REG_SERVICE_PORT) registry:2
configure-environment: init-swarm create-container-registry
destroy-container-registry:
	$(DOCKER_COMMAND) service rm registry
leave-swarm:
	$(DOCKER_SWARM_COMMAND) leave --force
destroy-environment: destroy-container-registry leave-swarm

# Stack
.PHONY: build-stack register-stack create-stack 
.PHONY:	rebuild-stack deploy-stack destroy-stack 

build-stack:
	$(DOCKER_COMPOSE_COMMAND) build
register-stack:
	$(DOCKER_COMPOSE_COMMAND) push
create-stack: configure-environment build-stack register-stack
rebuild-stack: build-stack register-stack
deploy-stack:
	$(DOCKER_COMMAND) stack deploy --compose-file $(COMPOSE_FILE) $(STACK_NAME)
destroy-stack:
	$(DOCKER_COMMAND) stack rm $(STACK_NAME)
