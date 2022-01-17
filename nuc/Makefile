.PHONY: deploy-nuc deploy-docker deploy-gitlab-runner

deploy-docker:
	ansible-playbook --inventory ./inventory.ini --ask-vault-pass docker/playbook.yml

deploy-nuc:
	ansible-playbook --inventory ./inventory.ini nuc/playbook.yml

deploy-gitlab-runner:
	# ansible-galaxy collection install community.general
	ansible-playbook --inventory ./inventory.ini gitlab-runner/playbook.yml

