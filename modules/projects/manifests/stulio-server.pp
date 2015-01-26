class projects::stulio-server {
  include imagemagick

  $home = "/Users/${::boxen_user}"
  $dirname = "stulio-server"
  $stulioserverdir = "${boxen::config::srcdir}/${dirname}"


  boxen::project { $dirname: 
    mysql => ['photo_development', 'photo_test'],
    redis => true,
    source => 'ssh://dev01.phybbit.com/home/developer/Stulio/Server.git'
  }


  file { "${stulioserverdir}/web.pem":
    ensure => 'present',
    mode => 600,
    require => Boxen::Project[$dirname] 
  }
  
  file { "${stulioserverdir}/db.pem":
    ensure => 'present',
    mode => 600,
    require => Boxen::Project[$dirname] 
  }

  file { "${home}/.ssh/web.pem":
    ensure => link,
    target => "${stulioserverdir}/web.pem",
    require => Boxen::Project[$dirname] 
  }  

  file { "${home}/.ssh/db.pem":
    ensure => link,
    target => "${stulioserverdir}/db.pem", 
    require => Boxen::Project[$dirname]
  }  
  
  include sshuserconfig
  sshuserconfig::host {
    "ec2-50-17-204-59.compute-1.amazonaws.com":
    remote_hostname => "ec2-50-17-204-59.compute-1.amazonaws.com",
    remote_username => "ec2-user",
    priv_key_name => "web.pem",
    require => File["${home}/.ssh/web.pem"] 
  }

  sshuserconfig::host {
    "integration":
    remote_hostname => "ec2-50-17-204-59.compute-1.amazonaws.com",
    remote_username => "ec2-user",
    priv_key_name => "web.pem",
    require => File["${home}/.ssh/web.pem"] 
  }

  sshuserconfig::host {
    "production-db":
    remote_hostname => "176.32.91.110",
    remote_username => "ec2-user",
    priv_key_name => "db.pem",
    require => File["${home}/.ssh/db.pem"]
  }

  sshuserconfig::host {
    "176.32.91.110":
    remote_hostname => "176.32.91.110",
    remote_username => "ec2-user",
    priv_key_name => "db.pem",
    require => File["${home}/.ssh/db.pem"]
  }

  sshuserconfig::host {
    "production-web1":
    remote_hostname => "46.51.251.23",
    remote_username => "ec2-user",
    priv_key_name => "db.pem",
    require => File["${home}/.ssh/db.pem"]
  }

  sshuserconfig::host {
    "46.51.251.23":
    remote_hostname => "46.51.251.23",
    remote_username => "ec2-user",
    priv_key_name => "db.pem",
    require => File["${home}/.ssh/db.pem"]
  }

  sshuserconfig::host {
    "production-web2":
    remote_hostname => "46.51.251.43",
    remote_username => "ec2-user",
    priv_key_name => "db.pem",
    require => File["${home}/.ssh/db.pem"]
  }

  sshuserconfig::host {
    "46.51.251.43":
    remote_hostname => "46.51.251.43", 
    remote_username => "ec2-user",
    priv_key_name => "db.pem",
    require => File["${home}/.ssh/db.pem"]
  }

  sshuserconfig::host {
    "production-web3":
    remote_hostname => "54.238.49.50",
    remote_username => "ec2-user",
    priv_key_name => "db.pem",
    require => File["${home}/.ssh/db.pem"]
  }

  sshuserconfig::host {
    "54.238.49.50":
    remote_hostname => "54.238.49.50", 
    remote_username => "ec2-user",
    priv_key_name => "db.pem",
    require => File["${home}/.ssh/db.pem"]
  }

  sshuserconfig::host {
    "production-web4":
    remote_hostname => "54.238.50.91",
    remote_username => "ec2-user",
    priv_key_name => "db.pem",
    require => File["${home}/.ssh/db.pem"]
  }

  sshuserconfig::host {
    "54.238.50.91":
    remote_hostname => "54.238.50.91", 
    remote_username => "ec2-user",
    priv_key_name => "db.pem",
    require => File["${home}/.ssh/db.pem"]
  }
}
