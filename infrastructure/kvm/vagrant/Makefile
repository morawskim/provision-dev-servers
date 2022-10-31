.PHONY: setup vagrant-apply vagrant-setup-kvm

setup:
	mkdir -p terraform.d/plugins/github.com/dmacvicar/libvirt/0.6.3/linux_amd64/
	wget -Oterraform-provider-libvirt.tar.gz https://github.com/dmacvicar/terraform-provider-libvirt/releases/download/v0.6.3/terraform-provider-libvirt-0.6.3+git.1604843676.67f4f2aa.openSUSE_Tumbleweed.x86_64.tar.gz
	tar xzvf terraform-provider-libvirt.tar.gz
	mv terraform-provider-libvirt terraform.d/plugins/github.com/dmacvicar/libvirt/0.6.3/linux_amd64/
	rm terraform-provider-libvirt.tar.gz

vagrant-setup-kvm:
	virsh -c 'qemu:///system' pool-define-as default dir - - - - "/var/lib/libvirt/images"
	virsh -c 'qemu:///system' pool-build default
	virsh -c 'qemu:///system' pool-start default
	virsh -c 'qemu:///system' pool-autostart default
	virsh -c 'qemu:///system' pool-info default

vagrant-apply:
	TERRAFORM_LIBVIRT_TEST_DOMAIN_TYPE=qemu terraform apply
