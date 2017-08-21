# comment
class gitlab::config {
  
 # template(<FILE REFERENCE>, [<ADDITIONAL FILES>, ...])
  file { '/tmp/gitlab.rb':
    ensure  => file,
    content => template('gitlab/gitlab.rb.erb'),
  }

  file { "/gitlab-data":
    ensure => 'directory',
  }

  
}
