# Class: postfix
#
# This module manages postfix
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
# class { 'postfix':
#   relayer => "smtp.isp.tld",
# }
#
# [Remember: No empty lines between comments and class definition]
class postfix($relayer='',$options=undef) {

  include postfix::params

  if $relayer != '' {
    $relayhost = "[${relayer}]"
  } else {
    $relayhost = ''
  }

  $hostname = $::fqdn

  file { '/etc/postfix/main.cf':
    ensure  => present,
    content => template('postfix/main.cf.erb'),
    require => Package['postfix']
  }

  package { 'postfix':
    ensure => installed,
  }

  service { 'postfix':
    ensure    => running,
    hasstatus => true,
    enable    => true,
    subscribe => File['/etc/postfix/main.cf'],
  }
}
