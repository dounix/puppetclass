include apache
apache::vhost { 'vjames.puppetlabs.vm':
  docroot => "/var/www/html/vjames.puppetlabs.vm",
  notify => Service[$apache::service],
}

#apache::vhost { 'wjames.puppetlabs.vm':
#  docroot => "/var/www/html/vjames.puppetlabs.vm",
#  notify => Service[$apache::service],

#}
#
#apache::vhost { 'xjames.puppetlabs.vm':
#  docroot => "/var/www/html/vjames.puppetlabs.vm",
#  notify => Service[$apache::service],

#}
