class profile::example {
  @@file { "/root/${facts['fqdn']}":
    ensure => present,
    tag    => 'silly',
  }

  File <<| tag == 'silly' |>>

}
