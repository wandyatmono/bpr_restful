# af-00-users.md

`Jum'at, 19 Juli 2019`

**`21:05`**

Setelah pondasi mengenai routes diletakkan. Ditambah telah disertakannya features redireksi ke static HTML file yang memberikan informasi mengenai semua routes dan yang memberikan informasi kesalahan routes. Berikut ini akan dibuat subversion baru.

Ke dalam subversion baru ini akan ditambahkan routes dengan beberapa API middleware untuk melayani permintaan data yang terkait dengan users.

Perlu diingat, bahwa di `frontend` pengembangan telah lebih 'maju' dibandingkan dengan pengembangan RESTful API Server ini. Terutama di dalam pengujian-pengujian selama pengembangan, `frontend` menggunakan RESTful API Server yang telah 'jadi' dan telah dipergunakan oleh `Widuran` projects. Termasuk databasenya.

```bash
$ # project-root
$ cp -rf projects/ae-utilities/ projects/af-users
```

**`21:10`**