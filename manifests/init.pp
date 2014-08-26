


class iptables {

    case $operatingsystemrelease {
       /^7.*/: {
          package { 'iptables-services': ensure => latest }
       }
    } 

    resources { "firewall":
        purge => true
    }

    Firewall {
        before  => Class['iptables::post'],
        require => Class['iptables::pre'],
    }

    class { ['iptables::pre', 'iptables::post']: }
    class { 'firewall': }
}

