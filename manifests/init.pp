# == Class: telldus
#
# A module to install telldus-core
#
# === Parameters
# ["version"]
#   The package version to install
#
# ["controller"]
#   Serial number of tellstick controller
#
# ["devices"]
#   An array of hashes with devices
#
# ["enable"]
#   Should the service be enabled during boot time?
#
# ["start"]
#   Should the service be started by Puppet

class telldus (
  $version = 'present',
  $controller = 1234,
  $devices = [
              { name => 'A1', house => 'A', unit => 1 },
              { name => 'A2', house => 'A', unit => 2 }
              ],
  $enable = true,
  $start = true
  )  {
    class{'telldus::install': } ->
    class{'telldus::configure': } ~>
    class{'telldus::service': } ->
    Class['telldus']
  }
