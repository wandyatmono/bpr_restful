# 00-reset-mysql-password.md

`Minggu, 21 Juli 2019`

**`04:53`**

## Reset a MySQL root password

https://support.rackspace.com/how-to/mysql-resetting-a-lost-mysql-root-password/
Last updated on: 2018-12-21 Authored by: Rackspace Support


The MySQL root password allows the root user to have full access to the MySQL database. You must have (Linux) root or (Windows) Administrator access to the Cloud Server to reset the MySQL root password.

> Note: The Cloud Server (Linux) root or (Windows) Administrator account password is not the same as the MySQL password. The Cloud Server password allows access to the server. The MySQL root password allows access only to the MySQL database.

Use the following steps to reset a MySQL root password by using the command line interface.

### Stop the MySQL service

(Ubuntu and Debian) Run the following command:

```bash
$ sudo /etc/init.d/mysql stop
```

### Start MySQL without a password

Run the following command. The ampersand (&) at the end of the command is required.

```bash
$ sudo mysqld_safe --skip-grant-tables &
```

### Connect to MySQL

Run the following command:

```bash
$ mysql -uroot
```

### Set a new MySQL root password

Run the following command:

```bash
$ use mysql;
$ update user set authentication_string=PASSWORD("mynewpassword") where User='root';
$ flush privileges;
$ quit
```

### Stop and start the MySQL service

(Ubuntu and Debian) Run the following commands:

```bash
$ sudo /etc/init.d/mysql stop
...
$ sudo /etc/init.d/mysql start
```

### Log in to the database

Test the new password by logging in to the database.

```bash
$ mysql -u root -p
```

Enter your new password when prompted.

**`04:29`**