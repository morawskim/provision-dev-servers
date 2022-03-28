.PHONY: deploy-nuc deploy-docker deploy-gitlab-runner setup-ansible-modules

setup-ansible-modules:
	test -d ansible-modules/ansible-gpg-key || git clone https://github.com/netson/ansible-gpg-key.git ansible-modules/ansible-gpg-key
	ansible-galaxy collection install community.libvirt
	ansible-galaxy collection install community.general

deploy-docker: setup-ansible-modules
	ANSIBLE_LIBRARY=$(PWD)/ansible-modules:/usr/share/ansible/plugins/modules ansible-playbook --inventory ./inventory.ini --ask-vault-pass docker/playbook.yml

deploy-nuc: setup-ansible-modules
	ansible-playbook --inventory ./inventory.ini nuc/playbook.yml

deploy-gitlab-runner: setup-ansible-modules
	ansible-playbook --inventory ./inventory.ini --ask-vault-pass gitlab-runner/playbook.yml
