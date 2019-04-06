# rke-docker
This project builds a container that provides the rke cli, developed and maintained by Rancher Labs [![Build Status](https://ci.devopoly.de/api/badges/lukibahr/rke-docker/status.svg)](https://ci.devopoly.de/lukibahr/rke-docker)

## Intension

Avoid downloading the rke cli tool. Instead use containers for everything.

## Manually building the project

The containing Makefile provides targets which wrap complex commands such as docker build tag and push.
Building the container downloads the rke binary from the github releases page of rke.

```sh 
make RKE_VERSION=v0.2.1 build
or 
make RKE_VERSION=v0.2.1 all
```

## Usage

Simply pull and run the container, by mounting your cluster.yml inside the container. 



```bash
docker pull lukasbahr/rke-docker:v0.2.1
docker run -it -v $PWD/cluster.yml:/deployment lukasbahr/rke-docker:v0.2.1 up 
```


Note: If you're pointing to your SSH Key, keep in mind that you'll likely mount your ssh key or paste it inline. 

## Contribution
- Lukas Bahr, lukas@devopoly.de




