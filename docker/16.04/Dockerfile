FROM ubuntu:16.04
RUN apt-get update && \
	apt-get install software-properties-common -y && \
	apt-add-repository ppa:ansible/ansible && \
	apt-get update && \
	apt-get install ansible build-essential git -y
