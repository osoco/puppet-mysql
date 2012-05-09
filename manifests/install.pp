class mysql::install ($version = "latest", $root_pwd = "my5q1") {

    $package_name = "mysql-server"

    package { "$package_name":
        ensure => "$version"
    }

    $update_root_pwd_sql = "UPDATE mysql.user SET Password=PASSWORD('$root_pwd') WHERE User='root' AND Host='localhost'; FLUSH PRIVILEGES;"

    exec { "set-root-password":
        command => "echo \"$update_root_pwd_sql\" | mysql -u root",
        refreshonly => true,
        subscribe => Package["$package_name"],
        require => Package["$package_name"]
    }

}
