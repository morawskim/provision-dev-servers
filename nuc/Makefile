.PHONY: deploy-traefik deploy-ttrss deploy-ots

deploy-traefik:
	ansible-playbook --inventory ./inventory.ini docker/traefik/playbook.yml

deploy-ttrss:
	ansible-playbook --inventory ./inventory.ini --ask-vault-pass docker/ttrss/playbook.yaml

deploy-ots:
	ansible-playbook --inventory ./inventory.ini docker/ots/playbook.yaml
