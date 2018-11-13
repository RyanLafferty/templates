# kubernetes

## Installation

1. Make, sh
2. Docker, docker-compose, docker-machine

```Bash
make install
```

### Technologies
1. Make, sh
2. Docker, docker-compose, docker-machine
3. mysql, kubernetes, minikube

## TODO - Cleaning Up Docker
```Bash
make docker-clean
```

## TODO - Destroying The Docker Environment
```Bash
make docker-destroy
```

## Application

### Starting The Server

```Bash
make up
```

### Rebuilding The Docker Container

```Bash
make build && make up

OR

make reup
```

### Application Commands

```Bash
# Builds, (re)creates, starts, and attaches to containers for the app container.
make up

# Starts an already built app container
make start

# Stops the app container
make stop

# SSH into the local app container
make ssh

# Builds the app container
make build
```

## Database - TODO


## Kubernetes

### Start Local Minikube Cluster

```Bash
make start-minikube
```

### Use Minikube Docker Daemon

```Bash
eval $(minikube docker-env)
```

### Building The Images

```Bash
make build
```

### Creating The Cluster

```Bash
make create-cluster
```

### Accessing The Cluster

```Bash
# Use the url provided by the following command
make cluster-url
```

### Destroying The Cluster

```Bash
make destroy-cluster
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

# Creates the local kubernetes cluster
make create-cluster

# Destroys the local kubernetes cluster
make destroy-cluster

# Inspects the local kubernetes cluster
make inspect-cluster

# Outputs the local kubernetes cluster url
make cluster-url

# Starts the local kubernetes dashboard
make start-dashboard
```
