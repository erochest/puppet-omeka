# == Class: omeka
#
# Full description of class omeka here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { omeka:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Eric Rochester <erochest@virginia.edu>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class omeka(
  $hostname = 'localhost',
  $branch   = 'stable-2.0',
  $rootdir  = '/usr/local/projects',
  $dbuser   = 'omeka',
  $dbpass   = 'omeka',
  $dbname   = 'omeka',
  $dbprefix = 'omeka_',
  $server   = 'apache2',
  $debug    = false
) {

  class { 'omeka::install' : } ->
  class { 'omeka::code'    : } ->
  class { 'omeka::config'  : } ->
  class { 'omeka::service' : } ->
  Class['omeka']

}
