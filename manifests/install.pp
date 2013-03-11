
class omeka::install {
  $server = $omeka::server
  $php    = $server ? {
    'apache2' => 'php5',
    'nginx'   => 'php5-fpm',
    default   => 'php5',
  }

  if $server == 'apache2' {
    package { 'apache2':
      ensure => installed,
    }
    package { 'php5':
      ensure => installed,
    }
  } else {
    package { 'nginx':
      ensure => installed,
    }
    package { 'php5-fpm':
      ensure => installed,
    }
  }

  package { 'mysql-server':
    ensure => installed,
  }

  package { 'php5-mysql':
    ensure => installed,
  }

  package { 'imagemagick':
    ensure => installed,
  }

  package { 'git':
    ensure => installed,
  }

}

