class users {
   user { 'james':
      gid     => 'staff',
      ensure  => present,
      shell   => '/bin/bash',
   }
   group { 'staff':
     ensure => present,
   }
}
