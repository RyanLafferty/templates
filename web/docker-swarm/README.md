# docker-swarm

## Installation

1. Make, sh
2. Docker, docker-compose, docker-machine

```Bash
make install
```

### Technologies
1. Make, sh
2. Docker, docker-compose, docker-machine
3. mysql

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


## Swarm

### Creating The Swarm

```Bash
make create-stack
```

### Deploying The Swarm

```Bash
make deploy-stack
```

### (Re)creating The Swarm

```Bash
make rebuild-stack
```

### Destroying The Swarm

```Bash
make destroy-stack && make destroy-environment
```

### Service Commands
```Bash
# Initializes the swarm
make init-swarm

# Creates the container registry
make create-container-registry

# Configures the swarm environment
make configure-environment

# Destroys the container registry
make destroy-container-registry

# Leaves the swarm
make leave-swarm

# Destroys the environment
make destroy-environment
```


### Stack Commands
```Bash
# Builds the application stack
make build-stack

# Registers the application stack
make register-stack

# Creates the application stack
make create-stack

# (Re)creates the application stack
make rebuild-stack

# Deploys the stack
make deploy-stack

# Destroys the stack
make destroy-stack
```
