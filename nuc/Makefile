.PHONY: deploy-nuc deploy-docker deploy-gitlab-runner setup-ansible-modules

setup-ansible-modules:
	test -d ansible || mkdir ansible
	mkdir -p ansible/{modules,roles}
	test -d ansible/modules/ansible-gpg-key || git clone https://github.com/netson/ansible-gpg-key.git ansible/modules/ansible-gpg-key
	ansible-galaxy collection install community.libvirt
	ansible-galaxy collection install community.general
	ansible-galaxy role install -p ansible/roles  newrelic.newrelic-infra

deploy-docker: setup-ansible-modules
	ANSIBLE_LIBRARY=$(PWD)/ansible-modules:/usr/share/ansible/plugins/modules ansible-playbook --inventory ./inventory.ini --ask-vault-pass docker/playbook.yml

deploy-nuc: setup-ansible-modules
	 ANSIBLE_ROLES_PATH=$(PWD)/ansible/roles ansible-playbook --ask-vault-pass --inventory ./inventory.ini nuc/playbook.yml

deploy-gitlab-runner: setup-ansible-modules
	ansible-playbook --inventory ./inventory.ini --ask-vault-pass gitlab-runner/playbook.yml

.PHONY: vagrant-ssh-jump
vagrant-ssh-jump:
	bash -c '[[ ! -z "$(VM)" ]] && true || (echo "VM arg is empty"; exit 2)'
	ssh -J vagrant@`vagrant ssh -c 'ip -4 addr show eth1 | grep -oP "(?<=inet\s)\d+(\.\d+){3}"'` \
		-o PKCS11Provider=/usr/lib64/opensc-pkcs11.so ubuntu@$(VM) \
		-o UserKnownHostsFile=/dev/null \
		-o StrictHostKeyChecking=no
