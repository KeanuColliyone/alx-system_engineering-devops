# 1-user_limit.pp
# This Puppet manifest increases the open file descriptor limit for the holberton user to avoid "Too many open files" errors.

exec { 'change-os-configuration-for-holberton-user':
  command => 'echo "holberton soft nofile 4096" >> /etc/security/limits.conf && echo "holberton hard nofile 4096" >> /etc/security/limits.conf',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  unless  => 'grep -q "holberton" /etc/security/limits.conf',
}

# Ensure PAM limits module is enabled to enforce limits.conf settings
file_line { 'pam_limits':
  path => '/etc/pam.d/common-session',
  line => 'session required pam_limits.so',
  match => '^#?session\s+required\s+pam_limits\.so',
}

file_line { 'pam_limits_non_interactive':
  path => '/etc/pam.d/common-session-noninteractive',
  line => 'session required pam_limits.so',
  match => '^#?session\s+required\s+pam_limits\.so',
}

