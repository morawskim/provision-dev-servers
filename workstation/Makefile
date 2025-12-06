.PHONY: ping
ping:
	ansible-playbook --ask-pass -i ./inventory.yml --limit lenovo playbook-ping.yml

.PHONY: lenovo
lenovo:
	ansible-playbook --ask-pass --ask-become-pass -i ./inventory.yml --limit lenovo lenovo/playbook.yml
