node default {
  $packages = lookup(workstation::packages);
  $packages_gui = lookup(workstation::packages-gui);
  $rpmkeys = lookup(workstation::rpmkeys)
  $zypprepos = lookup(workstation::zypprepos, {merge => deep})

  package {['postfix', 'rsyslog']:
    ensure => absent
  }
  package { $packages:
    ensure => present
  }
  package { $packages_gui:
    ensure => present
  }

  rpmkey {'devel_tools': * => $rpmkeys['devel_tools']}
  rpmkey {'google_chrome': * =>  $rpmkeys['google_chrome']}
  rpmkey {'kde_extra': * => $rpmkeys['kde_extra']}
  rpmkey {'microsoft': * =>  $rpmkeys['microsoft']}
  rpmkey {'morawskim': * =>  $rpmkeys['morawskim']}
  rpmkey {'packman': * => $rpmkeys['packman']}
  rpmkey {'security_privacy': * => $rpmkeys['security_privacy']}
  rpmkey {'skype': * => $rpmkeys['skype']}
  rpmkey {'system_snappy': * => $rpmkeys['system_snappy']}
  rpmkey {'utilities': * => $rpmkeys['utilities']}
  rpmkey {'vivaldi': * => $rpmkeys['vivaldi']}
  rpmkey {'yarn': * => $rpmkeys['yarn']}
  zypprepo { 'devel_tools': * => $zypprepos['devel_tools']}
  zypprepo { 'google_chrome': * => $zypprepos['google_chrome']}
  zypprepo { 'kde_extra': * => $zypprepos['kde_extra']}
  zypprepo { 'morawskim': * => $zypprepos['morawskim']}
  zypprepo { 'packman': * => $zypprepos['packman']}
  zypprepo { 'security_privacy': * => $zypprepos['security_privacy']}
  zypprepo { 'skype_stable': * => $zypprepos['skype_stable']}
  zypprepo { 'system_snappy': * => $zypprepos['system_snappy']}
  zypprepo { 'utilities': * => $zypprepos['utilities']}
  zypprepo { 'vivaldi': * => $zypprepos['vivaldi']}
  zypprepo { 'vscode': * => $zypprepos['vscode']}
  zypprepo { 'yarn': * => $zypprepos['yarn']}

  ensure_resource(
    'service',
    'apache2',
    lookup('workstation::services')['apache2']
  )
  ensure_resource(
    'service',
    'cups',
    lookup('workstation::services')['cups']
  )
  ensure_resource(
    'service',
    'docker',
    lookup('workstation::services')['docker']
  )
  ensure_resource(
    'service',
    'snapd',
    lookup('workstation::services')['snapd']
  )

  class {'firewalld': }
  class {'sensi::nullmailer':
    remote     => lookup('workstation::nullmailer::remote'),
    admin_addr => lookup('workstation::nullmailer::admin_addr'),
    me         => lookup('workstation::nullmailer::me'),
  }

  Rpmkey<||> -> Zypprepo<||>
  Zypprepo<||> -> Package<||>
  Package<||> -> Service<||>
  File <| ensure == 'dir' |> -> File <| ensure == 'present' |>

  Package<|title == 'postfix'|> -> Package<|title == 'nullmailer'|>
  Package<|title == 'rsyslog'|> -> Package<|title == 'systemd-logger'|>
}
