class mysql::install ($version = "latest", $root_pwd = "my5q1") {

  case $operatingsystem {
    Debian,ubuntu: {
      include mysql::install::debian
    }
    Gentoo: {
      include mysql::install::gentoo
    }
    default: {
      fail("${operatingsystem} is not supported by this module.")
    }
  }

}
