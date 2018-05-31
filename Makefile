.PHONY: \
	play-ubuntu-localhost

play-ubuntu-localhost:
	ansible-playbook -i "localhost," -c local ubuntu.yml
