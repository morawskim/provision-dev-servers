.PHONY: vagrant-ssh-jump
vagrant-ssh-jump:
	bash -c '[[ ! -z "$(VM)" ]] && true || (echo "VM arg is empty"; exit 2)'
	ssh -J vagrant@`vagrant ssh -c 'ip -4 addr show eth1 | grep -oP "(?<=inet\s)\d+(\.\d+){3}"'` \
		-o PKCS11Provider=/usr/lib64/opensc-pkcs11.so ubuntu@$(VM) \
		-o UserKnownHostsFile=/dev/null \
		-o StrictHostKeyChecking=no
