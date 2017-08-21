
#comment
class gitlab::install {
  
   $packages = [ "curl", "sudo", "ca-certificates" ]

   package{ $packages:
     ensure => "installed", 
   } ->

   exec {"get_gitlab_repo_command":
     command => '/usr/bin/curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash',
     creates => "/etc/apt/sources.list.d/gitlab_gitlab-ce.list"
   } ->

   package { "gitlab-ce":
     ensure => "installed",
   }
}
