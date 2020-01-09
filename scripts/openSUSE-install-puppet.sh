#!/usr/bin/env bash

set -euo pipefail

zypper --non-interactive ref
zypper --non-interactive update
zypper --non-interactive in ruby2.5-rubygem-bundler

mkdir -p /usr/local/share/puppet
cd /usr/local/share/puppet
bundle init
bundle add --version "~> 5.5.0" puppet
bundle add librarian-puppet
