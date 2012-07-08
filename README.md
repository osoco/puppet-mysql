puppet-mysql
============

Puppet module to manage MySQL databases. Usually, mysql modules are complex and with lots of depencies. 
This module aims exactly the opposite. Yet less powerful, is small and simple to use. It can:

* Install mysql server with a parametrized root password
* Define a mysql service
* Create mysql databases
* Create mysql users with given grants

Has been tested on debian squeeze.

Usage
-----

Example of usage for create a database with name 'oneDatabase' with full-privileged user 'oneUser' and 
a readonly user 'oneReadOnlyUser', and another database with name 'anotherDatabase' with full-privileged user 'oneUser'.

	class some_machine_mysql {
	
	    mysql::database { 'oneDatabase': }
	    mysql::database { 'anotherDatabase': }
	
	    mysql::user { 'oneDatabase-oneUser-user':
	        user => 'oneUser',
	        password => 'oneUserPassword',
	        database => 'oneDatabase',
	    }
	
	    mysql::user { 'oneDatabase-oneReadOnlyUser-user':
	        user => 'oneReadOnlyUser',
	        password => 'oneReadOnlyUserPassword',
	        database => 'oneDatabase',
	        host => '%',
	        privileges => 'SELECT'
	    }
	
	    mysql::user { 'anotherDatabase-oneUser-user':
	        user => 'oneUser',
	        password => 'oneUserPassword',
        	database => 'anotherDatabase',
	    }
	
	}
