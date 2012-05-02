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
#
# [Remember: No empty lines between comments and class definition]
class postfix($relayer = undef) {
  if ! $relayer {
    $relayer = 'smtp.foo.bar'
  }
  $hostname = $::fqdn

  package { 'postfix':
    ensure => installed,
  }

  service { 'postfix':
    ensure    => running,
    hasstatus => true,
    enable    => true,
    subscribe => File['/etc/postfix/main.cf'],
  }

  file { '/etc/postfix/main.cf':
    source => template('postfix/main.cf.erb'),
  }
}
