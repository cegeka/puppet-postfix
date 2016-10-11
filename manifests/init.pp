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
class postfix($relayer='',$options=undef, $auto_generate_config=true) {

  include postfix::params

  if ($auto_generate_config == true) {
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
  }else{
    file { '/etc/postfix/main.cf':
      ensure  => present,
      source  => "puppet:///private-$::customerenv/postfix/main.cf",
      require => Package['postfix']
    }
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
