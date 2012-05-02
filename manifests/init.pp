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
# include postfix
# postfix::conf { relayer => "smtp.isp.tld" }
#
# [Remember: No empty lines between comments and class definition]
class postfix($relayer) {
  if ! $relayer {
    $relayer = ' '
  }

  $hostname = $::fqdn

  file { '/etc/postfix/main.cf':
    content => template('postfix/main.cf.erb'),
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
