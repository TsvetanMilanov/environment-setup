SHELL             := /bin/bash
DOCKER_DIR        := docker
DOCKER_IMAGE_NAME := ubuntu-ansible

.PHONY: \
	play-ubuntu-localhost \
	docker-build-images

play-ubuntu-localhost:
	ansible-playbook -i "localhost," -c local ubuntu.yml $(ANSIBLE_ARGS)

docker-build-images:
	@for d in `ls -d $(DOCKER_DIR)/*/`; do \
		pushd $$d && docker build -t $(DOCKER_IMAGE_NAME):`basename $$d` .; \
	done
