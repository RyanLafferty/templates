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

# Environment
.PHONY: install hooks

install:
	$(INSTALL_COMMAND)
hooks:
	cp hooks/* .git/hooks/

# Kubernetes
.PHONY: start-minikube delete-minikube stop-minikube
.PHONY: install-istio monitor-istio
.PHONY: inspect-cluster start-dashboard cluster-url

start-minikube:
	sh scripts/minikube.sh
delete-minikube:
	minikube delete
stop-minikube:
	$(MINICUBE_COMMAND) stop

install-istio:
	sh scripts/install-istio.sh
monitor-istio:
	kubectl get pods --namespace istio-system

inspect-cluster:
	$(KUBECTL_COMMAND) get all
start-dashboard:
	$(MINICUBE_COMMAND) dashboard
cluster-url:
	$(MINICUBE_COMMAND) service $(KUBERNETES_SERVICE) --url

# Knative
.PHONY: install-knative monitor-knative

install-knative:
	sh scripts/install-knative
monitor-knative:
	kubectl get pods --namespace knative-serving

# TODO
.PHONY: configure-environment destroy-environment

configure-environment: start-minikube install-istio install-knative
destroy-environment: delete-minikube stop-minikube