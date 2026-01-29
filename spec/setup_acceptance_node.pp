file { '/etc/systemd/system/cups.service.d/':
  ensure => directory,
}
file { '/etc/systemd/system/cups.service.d/limits.conf':
  ensure  => file,
  content => @(CONFIG),
    [Service]
    LimitNOFILE=65536
    | CONFIG
}
