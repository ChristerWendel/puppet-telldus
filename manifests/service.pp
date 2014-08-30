# == Class: telldus::service
#
# Controls the telldus service
class telldus::service {
  $ensure = $telldus::start ? {true => running, default => stopped}

  service { 'telldusd':
    ensure => $ensure,
    enable => $telldus::enable,
  }
}
