class mysql::install::gentoo {

  package { "dev-db/mysql" :
    ensure => "${mysql::install::version}"
  }

  exec { "install-db" :
    command => "mysql_install_db",
    require => Package["dev-db/mysql"]
  }

  exec { "set-root-password" :
    command => "mysqladmin -u root password '${mysql::install::root_pwd}'",
    require => Package["dev-db/mysql"]
  }

}
