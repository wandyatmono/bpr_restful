# aa-02-devenvo-mysql.md

`Minggu, 14 Juli 2019`

**`12:04`**

RESTful API Server terkait erat dengan database management system yang digunakan. Dan server ini akan saya hubungkan dengan MySQL dBms dan alat bantunya yang bernama MySQL Workbench. 

Perkara database schemma, mulai dari design sampai ke implementasinya akan saya dokumentasikan dalam satu alur dengan dokumentasi untuk REST-nya sendiri.

Berikut adalah MySQL berikut peralatannya yang installed

```bash
$ mysql -V
mysql  Ver 14.14 Distrib 5.5.62, for debian-linux-gnu (x86_64) using readline 6.3

$ cat /etc/mysql/my.cnf | grep port
# One can use all long options that the program supports.
# It has been reported that passwords should be enclosed with ticks/quotes
port		= 3306
port		= 3306

$ mysql-workbench --version
MySQL Workbench CE (GPL) 6.0.8 11354  build 833

Berikut adalah dokumen instalasi yang sebelumnya telah saya lakukan.

## MySQL Server

Sampai saat ini, belum pernah didokumentasikan upaya saya untuk menanam `MySQL` di environment pengembangan.

Sumber: https://support.rackspace.com/how-to/installing-mysql-server-on-ubuntu/

```bash
$ sudo apt-get update
$ sudo apt-get install mysql-server
```

## MySQL Client & MySQL-Workbench

Untuk client

Sumber: https://askubuntu.com/questions/489354/how-to-install-mysql-mysql-workbench-on-ubuntu-14-04

```bash
$ sudo apt-get install mysql-client
$ sudo apt-get install mysql-workbench
```

## Nodemon

Untuk membantu NodeJS, saya tanam pula nodemon.

Sumber: https://www.npmjs.com/package/nodemon

```bash
$ npm install -g nodemon
```

Ada issue saat mencoba `nodemon`!.

```bash
[nodemon] Internal watch failed: watch ENOSPC
```

resolver: https://github.com/remy/nodemon/issues/907

```bash
$ echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

**`12:16`**