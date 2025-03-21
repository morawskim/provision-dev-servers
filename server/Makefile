.PHONY: deploy-nuc deploy-gitlab-runner deploy-nuc-vagrant deploy-gitlab-runner-vagrant setup-ansible-modules


define macro-deploy-nuc
	ANSIBLE_ROLES_PATH=$(PWD)/ansible/roles ANSIBLE_LIBRARY=$(PWD)/ansible/modules:/usr/share/ansible/plugins/modules ansible-playbook --ask-vault-pass --inventory $(1) nuc/playbook.yml
endef

define macro-deploy-gitlab-runner
	ANSIBLE_ROLES_PATH=$(PWD)/ansible/roles ansible-playbook --inventory $(1) --ask-vault-pass vm-gitlab-runner/playbook.yml
endef

define macro-deploy-k8s
	ANSIBLE_ROLES_PATH=$(PWD)/ansible/roles ansible-playbook --inventory $(1) --ask-vault-pass vm-k8s/playbook.yml
endef

define macro-deploy-wazuh
	ANSIBLE_ROLES_PATH=$(PWD)/ansible/roles ansible-playbook --inventory $(1) vm-wazuh/playbook.yml
endef

setup-ansible-modules:
	test -d ansible || mkdir ansible
	mkdir -p ansible/{modules,roles}
	test -d ansible/modules/ansible-gpg-key || git clone https://github.com/netson/ansible-gpg-key.git ansible/modules/ansible-gpg-key
	ansible-galaxy collection install community.libvirt
	ansible-galaxy collection install community.general
	ansible-galaxy role install -p ansible/roles  newrelic.newrelic-infra

deploy-nuc: setup-ansible-modules
	 $(call macro-deploy-nuc, "./inventory.ini")

deploy-gitlab-runner: setup-ansible-modules
	$(call macro-deploy-gitlab-runner, "./inventory.ini")

deploy-wazuh: setup-ansible-modules
	$(call macro-deploy-wazuh, "./inventory.ini")

deploy-k8s: setup-ansible-modules
	$(call macro-deploy-k8s, "./inventory.ini")

deploy-nuc-vagrant: setup-ansible-modules
	$(call macro-deploy-nuc, "./inventory-vagrant.ini")

deploy-gitlab-runner-vagrant: setup-ansible-modules
	$(call macro-deploy-gitlab-runner, "./inventory-vagrant.ini")
