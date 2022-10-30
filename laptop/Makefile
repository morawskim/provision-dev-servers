collections:
	ansible-galaxy collection install --collections-path ./collections community.general:==4.1.0

workstation: collections
	ANSIBLE_COLLECTIONS_PATH=$(PWD)/collections sudo ansible-playbook ./playbook.yml

marcin:
	ansible-playbook ./playbook-marcin.yml
