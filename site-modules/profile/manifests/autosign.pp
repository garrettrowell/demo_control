class profile::autosign (
  Stdlib::Absolutepath $confdir = '/etc/puppetlabs/puppet'
){

  # use of this resource requires the puppetlabs/inifile module
  ini_setting { 'policy-based autosigning':
    setting => 'autosign',
    path    => "${confdir}/puppet.conf",
    section => 'master',
    value   => '/opt/puppetlabs/puppet/bin/autosign-validator',
    notify  => Service['pe-puppetserver'],
  }

  class { 'autosign':
    ensure => '0.1.4',
    config => {
      'general' => {
        'loglevel' => 'INFO',
      },
    },
  }

}
