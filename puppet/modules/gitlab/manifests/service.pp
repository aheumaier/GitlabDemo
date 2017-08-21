# comment
class gitlab::service {

  exec {'gitlab_reconfigure':
    command     => '/usr/bin/gitlab-ctl',
    path        => ['/usr/bin', '/usr/sbin'],
  }
}
