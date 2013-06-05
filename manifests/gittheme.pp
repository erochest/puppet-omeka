
define omeka::gittheme($url, $branch='master') {
  $rootdir = $omeka::rootdir

  exec { "$name-git":
    cwd     => "$rootdir/Omeka/themes",
    command => "git clone --branch $branch $url $name",
    path    => ['/usr/bin'],
    require => [Class['Omeka'], Package['git']],
    creates => "$rootdir/Omeka/themes/$name",
  }

}

