class { 'postfix':
  relayer           => 'dummy.isp.tld',
}
postfix::postmapfile{ 'recipient_access':
  options => ['dummy.intra REJECT Delivery to this domain is prohibited.']
}
