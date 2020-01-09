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
  zypprepo { 'yarn': * => $zypprepos['yarn']}

  Rpmkey<||> -> Zypprepo<||>
  Zypprepo<||> -> Package<||>
  Package<||> -> Service<||>
  File <| ensure == 'dir' |> -> File <| ensure == 'present' |>

  Package<|title == 'postfix'|> -> Package<|title == 'nullmailer'|>
  Package<|title == 'rsyslog'|> -> Package<|title == 'systemd-logger'|>
}