class { 'postfix':
  #  relayer           => 'dummy.isp.tld',
  relayer           => 'smtp.cegeka.be',
}
#postfix::postmapfile{ 'recipient_access':
#  options => ['dummy.intra REJECT Delivery to this domain is prohibited.']
#}

postfix::postmapfile{ 'virtual':
  #  options => ['dummy.isp.tld forward@other.isp.tld'],
  options => ['telenet.be fabian.dammekens@cegeka.be'],
}
