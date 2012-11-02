class { 'postfix':
  relayer           => 'dummy.isp.tld',
}
postfix::postmapfile{ 'recipient_access':
  options => ['dummy.intra REJECT Delivery to this domain is prohibited.']
}

postfix::postmapfile{ 'virtual':
  options => ['dummy.isp.tld forward@other.isp.tld'],
}

postfix::postmapfile{ 'virtual_regexp':
  options => ['/.*@dummy.isp.tld/ forward@other.isp.tld'],
}
