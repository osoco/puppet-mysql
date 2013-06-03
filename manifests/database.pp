define mysql::database {

    include mysql

    $db_name = $name
    $create_database_sql = "CREATE DATABASE $db_name DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci"

    exec { "create-database-$db_name":
        command => "echo \"$create_database_sql\" | mysql -u root -p$mysql::install::root_pwd",
        unless => "echo select 0 | mysql -u root -p$mysql::install::root_pwd $db_name",
        require => [Class["mysql::service"], Exec["set-root-password"]]
    }
    
}
