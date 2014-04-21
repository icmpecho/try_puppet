user { "git":
    ensure => "present",
    home => "/var/git",
}

file {
    "/var/git": ensure => directory, owner => git,
    require => User["git"];
    "/var/git/puppet": ensure => directory, owner => git,
    require => [User["git"], File["/var/git"]],
}

ssh_authorized_key { "git":
    ensure => present,
    key => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCiqB/STbvnEWRpMYkm9/w3ukTbxxosQUZMQKVlO0PQ3G1IGdEhPUN0viaHNMFXm0o4LyZKWPenEgu1W5dbpfBMgi7rEXsHcw2EDglPWCC5u+JpKhJm+b9hr3gbL8oREiJCbW09BW3jFdXIZA0lAZehTlouAnppI/+9cIacCVXeod94t+/ao3D8C05t0IQePzDGwYOLfOrGoLXjUxMczyeshVf6JVHZHdbMhIPQkb24bmWMQc3BB7wNZiYdB5Xqr+mDPpKVr4bdGV+AVxd+pLbUagqMfQrXs+DruDUuC9IioqnQu+pXVFdkRJGaR/mXAOlQlPhTfNlh+Krb/WgnZPQZ Ping@abctech-thailand.com",
    name => "Ping@abctech-thailand.com",
    target => "/var/git/.ssh/authorized_keys",
    type => rsa,
    require => File["var/git"],
}
