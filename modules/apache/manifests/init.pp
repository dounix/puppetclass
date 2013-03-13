class apache{
  case $::osfamily {
  'redhat': {
  $http_pkg='httpd'
  $http_cfg='/etc/httpd/conf/httpd.conf'
  $http_cfgd='/etc/httpd/conf.d'
  $http_owner='apache'
  $http_group='apache'
  $http_svc='httpd'
  $http_source = "puppet:///modules/apache/httpd.conf"
  $http_var="/var/www/html"
   }
  'debian': {
  $http_pkg='apache2'
  $http_cfg='/etc/apache2/apache2.conf'
  $http_cfgd='/etc/apache2/conf.d/apache2.conf'
  $http_owner='www-data'
  $http_group='www-data'
  $http_svc='apache2'
  $http_source = "puppet:///modules/apache/apache2.conf"
  $http_var = '/var/www/html'
   }
  default: {
    fail("OS family ${::osfamily} not supported")
  }
  }

  package { $http_pkg: ensure => installed, }

  #schedule { 'dontrun':

  #}


File {  
  owner  => $http_owner,
  group  => $http_group,
  mode   => 0644,
  }


file { ['/var/www', $http_var]: 
  ensure => directory,
  }

file { 'apacheindex':
  path => "${http_var}/index.html",
  ensure  => file,
  #source => 'puppet:///modules/apache/index.html',
  content => template('apache/index.erb'),
  require   => Package[$http_pkg],
  }

file { $http_cfg: 
  owner  => 'root', 
  group  => 'root', 
  ensure  => file,
  source => $http_source,
  require   => Package[$http_pkg],
  }


service { $http_svc: 
  ensure       => running,
  enable       => true,
  subscribe => File[$http_cfg],
  }

}
