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
class postfix {
  package { 'postfix':
    ensure => installed,
  }

  service { 'postfix':
    ensure => running,
    hasstatus => true,
    enable => true,
  }
}
