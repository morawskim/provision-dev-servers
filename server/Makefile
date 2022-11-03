.PHONY: deploy-nuc deploy-docker deploy-gitlab-runner deploy-nuc-vagrant setup-ansible-modules

setup-ansible-modules:
	test -d ansible || mkdir ansible
	mkdir -p ansible/{modules,roles}
	test -d ansible/modules/ansible-gpg-key || git clone https://github.com/netson/ansible-gpg-key.git ansible/modules/ansible-gpg-key
	ansible-galaxy collection install community.libvirt
	ansible-galaxy collection install community.general
	ansible-galaxy role install -p ansible/roles  newrelic.newrelic-infra

deploy-docker: setup-ansible-modules
	ANSIBLE_ROLES_PATH=$(PWD)/ansible/roles ANSIBLE_LIBRARY=$(PWD)/ansible/modules:/usr/share/ansible/plugins/modules ansible-playbook --inventory ./inventory.ini --ask-vault-pass vm-docker/playbook.yml

deploy-nuc: setup-ansible-modules
	 ANSIBLE_ROLES_PATH=$(PWD)/ansible/roles ansible-playbook --ask-vault-pass --inventory ./inventory.ini nuc/playbook.yml

deploy-nuc-vagrant: setup-ansible-modules
	ANSIBLE_ROLES_PATH=$(PWD)/ansible/roles ansible-playbook --ask-vault-pass --inventory ./inventory-vagrant.ini nuc/playbook.yml

deploy-gitlab-runner: setup-ansible-modules
	ANSIBLE_ROLES_PATH=$(PWD)/ansible/roles ansible-playbook --inventory ./inventory.ini --ask-vault-pass vm-gitlab-runner/playbook.yml
