# Setup workstation for openSUSE Tumbleweed

1. Install `ansible` and `make` - `sudo zypper --non-interactive in ansible make`
1. Execute `make workstation`
1. Execute `make marcin`

The target `workstation` of `make` installs additional ansible collection (via ansible-galaxy) and call ansible with correct path to installed collection.
