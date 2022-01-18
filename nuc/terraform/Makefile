.PHONY: setup

setup:
	mkdir -p terraform.d/plugins/github.com/dmacvicar/libvirt/0.6.3/linux_amd64/
	wget -Oterraform-provider-libvirt.tar.gz https://github.com/dmacvicar/terraform-provider-libvirt/releases/download/v0.6.3/terraform-provider-libvirt-0.6.3+git.1604843676.67f4f2aa.openSUSE_Tumbleweed.x86_64.tar.gz
	tar xzvf terraform-provider-libvirt.tar.gz
	mv terraform-provider-libvirt terraform.d/plugins/github.com/dmacvicar/libvirt/0.6.3/linux_amd64/
	rm terraform-provider-libvirt.tar.gz
