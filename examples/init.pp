class { 'postfix':
  relayer => 'dummy.isp.tld',
  options => [
    'virtual_alias_maps = hash:/etc/postfix/virtual regexp:/etc/postfix/virtual_regex',
    'smtpd_recipient_restrictions = check_recipient_access hash:/etc/postfix/recipient_access, reject_unauth_destination',
  ]
}
postfix::postmapfile{ 'recipient_access':
  options => ['dummy.intra REJECT Delivery to this domain is prohibited.']
}

postfix::postmapfile{ 'virtual':
  options => ['dummy.isp.tld forward@other.isp.tld'],
}

postfix::postmapfile{ 'virtual_regex':
  options => ['/.*@dummy.isp.tld/ forward@other.isp.tld'],
}
