class mysql::install::debian {

  $package_name = "mysql-server"

  package { "$package_name":
    ensure => "${mysql::install::version}"
  }

  $update_root_pwd_sql = "UPDATE mysql.user SET Password=PASSWORD('${mysql::install::root_pwd}') WHERE User='root' AND Host='localhost'; FLUSH PRIVILEGES;"

  exec { "set-root-password":
    command => "echo \"$update_root_pwd_sql\" | mysql -u root",
    refreshonly => true,
    subscribe => Package["$package_name"],
    require => Package["$package_name"]
  }

  exec { "install-db" :
    command => "echo 'Non needed step in debian, but the resource is needed as is a dependency'"
  }

}
