# Installs VirtualBox
#
# Usage:
#
#   include virtualbox
class virtualbox($version = '4.3.12', $build = '93733') {

  exec { 'Kill Virtual Box Processes':
    command     => 'pkill "VBoxXPCOMIPCD" || true && pkill "VBoxSVC" || true && pkill "VBoxHeadless" || true',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }

  package { "VirtualBox-${version}":
    ensure   => installed,
    provider => 'pkgdmg',
    source   => "http://download.virtualbox.org/virtualbox/${version}/VirtualBox-${version}-${build}-OSX.dmg",
    require  => Exec['Kill Virtual Box Processes'],
  }
}
