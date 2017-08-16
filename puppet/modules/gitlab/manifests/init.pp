class gitlab {

  # template(<FILE REFERENCE>, [<ADDITIONAL FILES>, ...])
  file { '/etc/ntp.conf':
    ensure  => file,
    content => template('github/github.rb.erb'),
    # Loads /etc/puppetlabs/code/environments/production/modules/ntp/templates/ntp.conf.erb
  }



  exec { 'tar -xf /Volumes/nfs02/important.tar':
    cwd     => '/var/tmp',
    creates => '/var/tmp/myfile',
    path    => ['/usr/bin', '/usr/sbin',],
  }
}
