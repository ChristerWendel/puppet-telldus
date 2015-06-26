# == Class: telldus::configure
#
# Configures the telldus daemon
class telldus::configure {
  $controller = $telldus::controller
  $devices = $telldus::devices

  file { '/etc/tellstick.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'plugdev',
    mode    => '0664',
    content => template('telldus/tellstick.erb'),
  }

  @file { '/etc/logstash/conf.d/telldus.conf':
    ensure => present,
    owner  => 'logstash',
    group  => 'logstash',
    mode   => '0644',
    source => 'puppet:///modules/telldus/logstash.conf',
    tag    => [logstash],
  }
}
