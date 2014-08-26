


class linux_firewall {

    case $operatingsystemrelease {
       /^7.*/: {
          package { 'iptables-services': ensure => latest }
       }
    } 

    resources { "firewall":
        purge => true
    }

    Firewall {
        before  => Class['linux_firewall::post'],
        require => Class['linux_firewall::pre'],
    }

    class { ['linux_firewall::pre', 'linux_firewall::post']: }
    class { 'firewall': }
}

