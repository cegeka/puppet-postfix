# This expects a postmap template file to be present
# Options can be passed to the postmap template file using the $options variable
define postfix::postmapfile($options=undef){
  exec { "postmap${name}":
    command     => "/usr/sbin/postmap /etc/postfix/${name}",
    refreshonly => true,
    require     => [
      File["/etc/postfix/${name}"],
      Package['postfix']
    ],
  }
  file { "/etc/postfix/${name}":
    ensure  => present,
    mode    => '0644',
    content => template("postfix/${name}.erb"),
    require => Package['postfix'],
    notify  => Exec["postmap${name}"],
  }
}
