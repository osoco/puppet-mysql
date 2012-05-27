class mysql::install::gentoo {

  package { "dev-db/mysql" :
    ensure => "${mysql::install::version}"
  }

  exec { "install-db" :
    command => "mysql_install_db",
    refreshonly => true,
    require => Package["dev-db/mysql"]
  }

  exec { "set-root-password" :
    command => "mysqladmin -u root password '${mysql::install::root_pwd}'",
    refresonly => true,
    require => Package["dev-db/mysql"]
  }

}
