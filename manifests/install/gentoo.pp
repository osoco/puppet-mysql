class mysql::install::gentoo {

  package { "dev-db/mysql" :
    ensure => "${mysql::install::version}"
  }

  file { "/etc/mysql/my.cnf" :
    owner => root,
    mode => 0644,
    content => template("mysql/my.cnf.erb"),
    require => Package["dev-db/mysql"]
  }      
  
  exec { "install-db" :
    command => "mysql_install_db",
    require => File["/etc/mysql/my.cnf"]
  }

  exec { "set-root-password" :
    command => "mysqladmin -u root password '${mysql::install::root_pwd}'",
    unless => "echo select 0 | mysql -u root -p${mysql::install::root_pwd}"   
  }

}
