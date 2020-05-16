node default {
  create_resources(
    'vcsrepo',
    lookup(marcin::vcsrepo),
    {}
  )

  create_resources(
    'file',
    lookup(marcin::files),
  )

  $user_home_path = '/home/marcin'
  ini_setting { "[${user_home_path}] konsole set profile name":
    ensure            => present,
    path              => "${user_home_path}/.config/konsolerc",
    section           => 'Desktop Entry',
    setting           => 'DefaultProfile',
    value             => "Shell.profile",
    key_val_separator => '=',
  }
}
