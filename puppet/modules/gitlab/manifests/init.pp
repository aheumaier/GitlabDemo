#
# comment
#
class gitlab () {

  class { 'gitlab::install': } ->
  class { 'gitlab::config': } ~>
  class { 'gitlab::service': } ->
  Class['gitlab']
}
