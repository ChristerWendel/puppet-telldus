# == Class: telldus::install
#
# Installs the telldus package
class telldus::install {
  include aptrepo

  aptrepo::addrepo { 'telldus':
    location => 'http://download.telldus.com/debian/',
    key      => 'http://download.telldus.com/debian/telldus-public.key',
  } -> Package['telldus-core']

  package { 'telldus-core':
    ensure => $telldus::version,
  }
}
