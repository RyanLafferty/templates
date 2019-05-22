# knative

## Installation

1. Make, sh
2. Docker, docker-compose, docker-machine
3. minikube


### Technologies
1. Make, sh
2. Docker, docker-compose, docker-machine
3. kubernetes, istio, knative, minikube


## Knative

### Start Local Minikube Environment

```Bash
make start-minikube
```

### Use Minikube Docker Daemon

```Bash
eval $(minikube docker-env)
```

### Install Istio

```Bash
make install-istio
```

### Install Knative

```Bash
make install-knative
```

### Stop Local Minikube Environment

```Bash
make stop-minikube
```

### Destroy Local Minikube Environment

```Bash
make delete-minikube
```

### Use Host Docker Daemon

```Bash
eval $(docker-machine env -u)
```

### Commands
```Bash
# Starts the local kubernetes environment
make start-minikube

# Stops the local kubernetes environment
make stop-minikube

# Deletes the local kubernetes environment
make delete-minikube
```
