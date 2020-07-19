require 'spec_helper'

describe 'host' do
  context selinux do
    it { should be_permissive }
  end
  context yumrepo('epel') do
    it { should be_enabled }
  end
  context yumrepo('webtatic') do
    it { should be_enabled }
  end
end

describe 'nginx' do
  context package('nginx') do
    it { should be_installed }
  end

  context service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  context port(80) do
    it { should be_listening }
  end

  context port(443) do
    it { should be_listening }
  end

  context file('/etc/nginx/pass') do
    it { should be_file }
    it { should be_mode 600 }
    it { should be_owned_by 'nginx' }
  end

  context command('curl -k -I -s https://portal.lvh.me/') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should contain('HTTP/1.1 401 Unauthorized') }
  end

  context command('curl --cacert /etc/pki/tls/certs/portal.lvh.me.crt -s https://portal.lvh.me/') do
    its(:exit_status) { should eq 0 }
  end
end

describe 'php' do
  context package('php56w-fpm') do
    it { should be_installed }
  end

  context service('php-fpm') do
    it { should be_enabled }
    it { should be_running }
  end

  context port(9000) do
    it { should be_listening.on('127.0.0.1') }
  end

  context command('bash -c \'ps -f -C php-fpm | grep "php-fpm: pool portal" | cut -f1 -d" "\' ') do
    its(:stdout) { should match /portal/ }
  end

#   context file('/var/run/php-fpm.sock') do
#     it { should be_socket }
#     it { should be_mode 660 }
#     it { should be_owned_by 'portal' }
#     it { should be_grouped_into 'nginx' }
#   end
end

describe 'user' do
  context group('portal') do
    it { should exist }
  end
  context user('portal') do
    it { should exist }
    it { should have_home_directory '/srv/www/portal' }
  end
  context file('/srv/www/portal/.ssh/id_rsa') do
    it { should be_file }
    it { should be_mode 600 }
    it { should be_owned_by 'portal' }
  end
  context file('/srv/www/portal/.ssh') do
    it { should be_directory }
    it { should be_mode 700 }
    it { should be_owned_by 'portal' }
  end
end

describe 'phpMyAdmin' do
  context command('curl -k -I -s https://phpmyadmin.portal.lvh.me/') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should contain('HTTP/1.1 401 Unauthorized') }
  end

  context command('curl --cacert /etc/pki/tls/certs/phpmyadmin.portal.lvh.me.crt -s https://phpmyadmin.portal.lvh.me/') do
    its(:exit_status) { should eq 0 }
  end
end

describe 'mysql' do
  context service('mariadb') do
    it { should be_enabled }
    it { should be_running }
  end

  context port(3306) do
    it { should be_listening }
  end

  context file('/root/.my.cnf') do
    it { should be_file }
    it { should be_mode 600 }
    it { should be_owned_by 'root' }
    it { should contain('password=').after('[client]') }
    its(:content) { should match /^password=/ }
  end

  context command(%q{mysql -uroot -NB  -e "SHOW DATABASES"}) do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should_not contain(/^test$/) }
  end

  context command(%q{mysql -uroot -NB  -e "SELECT user,host FROM mysql.user WHERE user = '';"}) do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should be_empty }
  end

  context command(%q{mysql -uroot -NB  -e "SELECT user,host FROM mysql.user WHERE host NOT IN ('localhost', '127.0.0.1', '::1');"}) do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should be_empty }
  end

  context command(%q{mysql -uroot -NB  -e "SELECT user,host, password FROM mysql.user WHERE password IS NULL OR password ='';"}) do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should be_empty }
  end
end
