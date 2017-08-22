# comment
class gitlab::service {

  exec {'gitlab_reconfigure':
    command     => '/usr/bin/sudo /usr/bin/gitlab-ctl reconfigure',
    path        => ['/usr/bin', '/usr/sbin'],
  }
}
 