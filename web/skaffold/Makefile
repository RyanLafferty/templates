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
SKAFFOLD_COMMAND := skaffold

# Kubernetes Config
KUBERNETES_SERVICE := express-app-service

# Docker Commands
DOCKER_COMMAND := docker
DOCKER_COMPOSE_COMMAND := docker-compose

# Container Reg Config
REG_PUBLISHED_PORT := 5000
REG_SERVICE_PORT := 5000


# Environment
.PHONY: install hooks

install:
	$(INSTALL_COMMAND)
hooks:
	cp hooks/* .git/hooks/

# Kubernetes
.PHONY: create-container-registry destroy-container-registry
.PHONY: start-minikube stop-minikube
.PHONY: configure-environment destroy-environment
.PHONY: inspect-cluster start-dashboard cluster-url

create-container-registry:
	$(DOCKER_COMMAND) service create --name registry --publish published=$(REG_PUBLISHED_PORT),target=$(REG_SERVICE_PORT) registry:2
destroy-container-registry:
	$(DOCKER_COMMAND) service rm registry

start-minikube:
	$(MINICUBE_COMMAND) start
	echo 'Use eval \$(minikube docker-env) to use minikube\'s docker daemon'
stop-minikube:
	$(MINICUBE_COMMAND) stop
	echo 'Use eval \$(docker-machine env -u) to use host docker daemon'

configure-environment: start-minikube create-container-registry
destroy-environment: destroy-container-registry stop-minikube

inspect-cluster:
	$(KUBECTL_COMMAND) get all
start-dashboard:
	$(MINICUBE_COMMAND) dashboard
cluster-url:
	$(MINICUBE_COMMAND) service $(KUBERNETES_SERVICE) --url

# Skaffold
.PHONY: skaffold-build skaffold-deploy skaffold-destroy skaffold-redeploy

skaffold-build:
	$(SKAFFOLD_COMMAND) build
skaffold-deploy:
	$(SKAFFOLD_COMMAND) deploy
skaffold-destroy:
	$(SKAFFOLD_COMMAND) destroy
skaffold-redeploy: skaffold-build skaffold-deploy
