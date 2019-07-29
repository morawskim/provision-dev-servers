#Add hieraconfig --hiera_config=hiera5.yaml
provision:
	sudo -E /usr/bin/puppet apply --modulepath=puppet/modules/ --hiera_config=hiera5.yaml puppet/manifest/${MANIFEST}.pp

init:
	sh -c 'cd puppet && librarian-puppet install'

.PHONY: provision init
