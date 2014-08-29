# == Class: telldus
#
# A module to install telldus-core
#
# === Parameters
# ["version"]
#   The package version to install
#
# ["enable"]
#   Should the service be enabled during boot time?
#
# ["start"]
#   Should the service be started by Puppet

class telldus (
  $version = 'present',
  $enable = true,
  $start = true
  )  {
    class{'telldus::install': } ~>
    class{'telldus::service': } ->
    Class['telldus']
  }
