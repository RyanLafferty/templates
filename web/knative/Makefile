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

# Docker Commands
DOCKER_COMMAND := docker

# Kubernetes Commands
MINICUBE_COMMAND := minikube
KUBECTL_COMMAND := kubectl

# Docker Config
REG_PUBLISHED_PORT := 5000
REG_SERVICE_PORT := 5000

# Environment
.PHONY: install hooks

install:
	$(INSTALL_COMMAND)
hooks:
	cp hooks/* .git/hooks/

# Kubernetes
.PHONY: start-minikube stop-minikube delete-minikube
.PHONY: install-istio monitor-istio
.PHONY: inspect-cluster start-dashboard

start-minikube:
	sh scripts/start-minikube.sh
stop-minikube:
	$(MINICUBE_COMMAND) stop
delete-minikube:
	$(MINICUBE_COMMAND) delete

install-istio:
	sh scripts/install-istio.sh
monitor-istio:
	kubectl get pods --namespace istio-system

inspect-cluster:
	$(KUBECTL_COMMAND) get all
start-dashboard:
	$(MINICUBE_COMMAND) dashboard

# Knative
.PHONY: install-knative monitor-knative
.PHONY: monitor-knative-serving monitor-knative-build monitor-knative-eventing
.PHONY: monitor-knative-pods monitor-knative-services
.PHONY: monitor-local-gateways inspect-local-gateway set-local-gateways

install-knative:
	sh scripts/install-knative.sh
monitor-knative:
	kubectl get configuration,revision,route
monitor-knative-serving:
	kubectl get pods --namespace knative-serving --watch
monitor-knative-build:
	kubectl get pods --namespace knative-build --watch
monitor-knative-eventing:
	kubectl get pods --namespace knative-eventing --watch
monitor-knative-pods:
	kubectl get pods -watch
monitor-knative-services:
	kubectl get ksvc --watch
monitor-local-gateways:
	kubectl get gateway --all-namespaces --watch
inspect-local-gateway:
	sh scripts/inspect-local-gateway.sh
get-local-gateways:
	sh scripts/set-local-gateways.sh

# Local Container Registry - TODO - figure out how to connect registry to minikube vm
.PHONY: create-container-registry destroy-container-registry

create-container-registry:
	$(DOCKER_COMMAND) run -d -p $(REG_PUBLISHED_PORT):$(REG_SERVICE_PORT) --restart=always --name registry registry:2
destroy-container-registry:
	$(DOCKER_COMMAND) stop registry
	$(DOCKER_COMMAND) rm registry

# TODO
.PHONY: configure-environment destroy-environment

configure-environment: start-minikube install-istio install-knative create-container-registry
destroy-environment: delete-minikube stop-minikube destroy-container-registry