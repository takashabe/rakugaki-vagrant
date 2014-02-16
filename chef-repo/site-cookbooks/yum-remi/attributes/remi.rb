default['yum']['remi']['repositoryid'] = 'remi'

case node['platform']
when 'amazon'
  default['yum']['remi']['description'] = 'Les RPM de remi pour Enterprise Linux 6 - $basearch'
  default['yum']['remi']['mirrorlist'] = 'http://rpms.famillecollet.com/enterprise/6/remi/mirror'
  default['yum']['remi']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
else
  case node['platform_version'].to_i
  when 5
    default['yum']['remi']['description'] = 'Les RPM de remi pour Enterprise Linux 5 - $basearch'
    default['yum']['remi']['mirrorlist'] = 'http://rpms.famillecollet.com/enterprise/5/remi/mirror'
    default['yum']['remi']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  when 6
    default['yum']['remi']['description'] = 'Les RPM de remi pour Enterprise Linux 5 - $basearch'
    default['yum']['remi']['mirrorlist'] = 'http://rpms.famillecollet.com/enterprise/6/remi/mirror'
    default['yum']['remi']['gpgkey'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  end
end

default['yum']['remi']['failovermethod'] = 'priority'
default['yum']['remi']['enabled'] = true
default['yum']['remi']['gpgcheck'] = true
