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
}
