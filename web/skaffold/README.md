# skaffold

## Installation

1. Make, sh
2. Docker, docker-compose, docker-machine

```Bash
make install
```

### Technologies
1. Make, sh
2. Docker, docker-compose, docker-machine
3. skaffold, kubernetes, minikube

## Skaffold

### Start Local Minikube Cluster

```Bash
make start-minikube
```

### Use Minikube Docker Daemon

```Bash
eval $(minikube docker-env)
```

### Building The Cluster

```Bash
make skaffold-build
```

### Deploying The Cluster

```Bash
make skaffold-deploy
```

### Accessing The Cluster

```Bash
# Use the url provided by the following command
make cluster-url
```

### Destroying The Cluster

```Bash
make skaffold-destroy
```

### Stop Local Minikube Cluster

```Bash
make stop-minikube
```

### Use Host Docker Daemon

```Bash
eval $(docker-machine env -u)
```

### Commands
```Bash
# Creates the container registry
make create-container-registry

# Destroys the container registry
make destroy-container-registry

# Starts the local kubernetes environment
make start-minikube

# Starts the local kubernetes environment
make start-minikube

# Stops the local kubernetes environment
make stop-minikube

# Configures the kubernetes environment
make configure-environment

# Destroys the environment
make destroy-environment

# builds the local kubernetes cluster
make skaffold-build

# deploys the local kubernetes cluster
make skaffold-deploy

# redeploys the local kubernetes cluster
make skaffold-redeploy

# destroys the local kubernetes cluster
make skaffold-destroy

# Inspects the local kubernetes cluster
make inspect-cluster

# Outputs the local kubernetes cluster url
make cluster-url

# Starts the local kubernetes dashboard
make start-dashboard
```
