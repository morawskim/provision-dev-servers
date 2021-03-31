.PHONY: deploy-traefik deploy-ttrss

deploy-traefik:
	ansible-playbook --inventory ./inventory.ini docker/traefik/playbook.yml

deploy-ttrss:
	ansible-playbook --inventory ./inventory.ini --ask-vault-pass docker/ttrss/playbook.yaml
