# Makefile as a command wrapper

NAMESPACE = lukasbahr
PROJECT = $(shell basename $(PWD))

RUNDOCKER = $(shell which docker) $(@)

include .env
export

all: login build tag push

login: 
	@$(RUNDOCKER) --username=$(REGISTRY_USER) --password=$(REGISTRY_PASSWORD) 

build: login
	$(RUNDOCKER) --build-arg RKE_VERSION=$(RKE_VERSION) -t $(NAMESPACE)/$(PROJECT):$(RKE_VERSION) -f Dockerfile .

tag: 
	$(RUNDOCKER) $(NAMESPACE)/$(PROJECT):$(RKE_VERSION) $(NAMESPACE)/$(PROJECT):$(RKE_VERSION)

pull: login
	$(RUNDOCKER) $(NAMESPACE)/$(PROJECT):$(RKE_VERSION)

push: 
	$(RUNDOCKER) $(NAMESPACE)/$(PROJECT):$(RKE_VERSION)

run:
	$(RUNDOCKER) $(NAMESPACE)/$(PROJECT):$(RKE_VERSION) --version

