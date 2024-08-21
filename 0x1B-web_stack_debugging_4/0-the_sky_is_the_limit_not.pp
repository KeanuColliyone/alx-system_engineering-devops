# This Puppet manifest optimizes the Nginx configuration by modifying the max open files limit and ensuring Nginx is restarted if necessary.

file { '/etc/default/nginx':
  ensure  => file,
  mode    => '0644',
  content => template('nginx/nginx.erb'),
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
}

exec { 'modify max open files limit setting':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  onlyif  => 'grep -q "15" /etc/default/nginx',
  notify  => Service['nginx'],
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games',
}

