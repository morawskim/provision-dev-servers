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
}
