define apache::vhost(
 $docroot,
 $options = 'Indexes Multiview',
 $vhostname = $name,
 $servername = $name,
) {
  
  file {"${apache::http_cfgd}/${name}": 
  ensure  => file,
  content => template('apache/vhost.conf.erb'),
  } 
  
  file { "${apache::docroot}":
  ensure  => directory
  }

  file { "${apache::docroot}/index.html":
  ensure  => file,
  content => template('apache/index.erb'),
  }

}

