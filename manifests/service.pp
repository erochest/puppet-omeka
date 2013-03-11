
class omeka::service {
  $server = $omeka::server

  service { $server :
    ensure  => running,
    enable  => true,
    require => Class['omeka::install'],
  }

  if $server == 'nginx' {
    service { 'php5-fpm' :
      ensure  => running,
      enable  => true,
      require => Class['omeka::install'],
    }
  }

  service { 'mysql' :
    ensure  => running,
    enable  => true,
    require => Class['omeka::install'],
  }

}

