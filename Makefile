provision: checkManifest
	sudo -E /usr/bin/puppet apply --modulepath=puppet/modules/ --hiera_config=hiera5.yaml puppet/manifest/${MANIFEST}.pp

init:
	sh -c 'cd puppet && librarian-puppet install'

graph: checkManifest
	sudo -E /usr/bin/puppet apply --noop --graph --graphdir=$(PWD) --modulepath=puppet/modules/ --hiera_config=hiera5.yaml puppet/manifest/${MANIFEST}.pp

checkManifest:
ifndef MANIFEST
	$(error MANIFEST is undefined)
endif

dot2png:
	dot relationships.dot -Tpng -o relationships.png
	dot resources.dot -Tpng -o resources.png
	dot expanded_relationships.dot -Tpng -o expanded_relationships.png

.PHONY: provision init graph dot2png
