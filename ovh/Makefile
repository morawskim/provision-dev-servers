setup-ansible-modules:
	test -d ansible || mkdir -p ansible/modules
	test -d ansible/modules/ansible-ovh-dns || git clone https://github.com/gheesh/ansible-ovh-dns.git ansible/modules/ansible-ovh-dns

ovh: setup-ansible-modules
	ANSIBLE_LIBRARY=$(PWD)/ansible/modules:/usr/share/ansible/plugins/modules ansible-playbook --ask-vault-pass playbook.yml
