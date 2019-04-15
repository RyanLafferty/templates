# TODO - add minikube install scripts
# TODO - add brew install scripts
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

# Kubernetes Commands
MINICUBE_COMMAND := minikube
KUBECTL_COMMAND := kubectl

# Kubernetes Config
APP_CLUSTER_CONFIG := app.yml
KUBERNETES_SERVICE := express-app-service
KUBERNETES_DEPLOYMENT := express-app-deployment

# Docker Commands
DOCKER_COMMAND := docker
DOCKER_SWARM_COMMAND := docker swarm
DOCKER_COMPOSE_COMMAND := docker-compose

# Docker Config
COMPOSE_FILE := docker-compose.yml
LOCAL_IMAGE_NAME := express-app
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

# Kubernetes
.PHONY: create-container-registry destroy-container-registry
.PHONY: start-minikube stop-minikube
.PHONY: configure-environment destroy-environment
.PHONY: create-cluster destroy-cluster inspect-cluster start-dashboard cluster-url

create-container-registry:
	$(DOCKER_COMMAND) run -d -p $(REG_PUBLISHED_PORT):$(REG_SERVICE_PORT) --restart=always --name registry registry:2
destroy-container-registry:
	$(DOCKER_COMMAND) stop registry
	$(DOCKER_COMMAND) rm registry

start-minikube:
	$(MINICUBE_COMMAND) start
	echo 'Use eval \$(minikube docker-env) to use minikube\'s docker daemon'
stop-minikube:
	$(MINICUBE_COMMAND) stop
	echo 'Use eval \$(docker-machine env -u) to use host docker daemon'

configure-environment: start-minikube create-container-registry
destroy-environment: destroy-container-registry stop-minikube

create-cluster:
	$(KUBECTL_COMMAND) create -f $(APP_CLUSTER_CONFIG)
destroy-cluster:
	$(KUBECTL_COMMAND) delete DEPLOYMENT $(KUBERNETES_DEPLOYMENT)
	$(KUBECTL_COMMAND) delete service $(KUBERNETES_SERVICE)
inspect-cluster:
	$(KUBECTL_COMMAND) get all
start-dashboard:
	$(MINICUBE_COMMAND) dashboard
cluster-url:
	$(MINICUBE_COMMAND) service $(KUBERNETES_SERVICE) --url
