
class omeka::config {
  $hostname = $omeka::hostname
  $rootdir  = $omeka::rootdir
  $debug    = $omeka::debug
  $server   = $omeka::server

  class { 'omeka::config::php'     : } ->
  class { 'omeka::config::mysql'   : } ->
  class { "omeka::config::$server" : } ->
  Class['omeka::config']

  file { 'db.ini':
    path    => "$rootdir/Omeka/db.ini",
    ensure  => file,
    mode    => 0644,
    content => template('omeka/db.erb'),
    notify  => Class['omeka::service'],
  }

  file { 'config/config.ini':
    path    => "$rootdir/Omeka/application/config/config.ini",
    content => template('omeka/config.erb'),
  }

  file { 'tests/config.ini':
    path    => "$rootdir/Omeka/application/tests/config.ini",
    content => template('omeka/test-config.erb'),
  }

  file { '.htaccess' :
    path   => "$rootdir/Omeka/.htaccess",
    source => "$rootdir/Omeka/.htaccess.changeme",
  }

  file { 'archive' :
    path    => "$rootdir/Omeka/archive",
    ensure  => directory,
    recurse => true,
    mode    => 0777,
    owner   => 'www-data',
    group   => 'www-data',
  }

  if $hostname != 'localhost' {
    host { $hostname :
      ip => '127.0.0.1',
    }
  }

}

