# comment
class gitlab::config {
  
  $git_data_path = "/gitlab-data"

 # template(<FILE REFERENCE>, [<ADDITIONAL FILES>, ...])
  file { '/etc/gitlab/gitlab.rb':
    ensure  => file,
    content => template('gitlab/gitlab.rb.erb'),
  }

  file { $git_data_path:
    ensure => 'directory',
  }

  
}
