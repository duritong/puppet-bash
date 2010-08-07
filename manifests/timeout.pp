class bash::timeout {
    include bash
    file{'/etc/profile.d/timeout.sh':
        source => "puppet:///modules/bash/profile.d/timeout.sh",
        require => Package['bash'],
        owner => root, group => 0, mode => 0755;
    }
}
