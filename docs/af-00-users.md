# af-00-users.md

`Jum'at, 19 Juli 2019`

**`21:05`**

Setelah pondasi mengenai routes diletakkan. Ditambah telah disertakannya features redireksi ke static HTML file yang memberikan informasi mengenai semua routes dan yang memberikan informasi kesalahan routes. Subversion berikutnya sudah dapat dibangun seiring dengan perkembangan `frontend`. Setiap kali `frontend` melakukan satu atau lebih request, routes dan middleware untuk memenuhi request tersebut dapat langsung dibangun.

Routes dan Middleware yang berupa API, akan telah terbangun adalah:

0. `/routes/utilities/sha256/:data`, digunakan untuk memberikan hasil hashing terhadap sepenggal data dan
1. `routes/utilities/uuid/naked`, digunakan untuk memberikan UUID random, tanpa informasi tambahan apapun.

CATATAN: Pada kenyataannya, `frontend` tidak akan meminta REST untuk melakukan hashing secara langsung. Tetapi justru REST yang akan 'berinisiatif' melakukan hashing. Sebagai contoh, saat sebuah API menerima request untuk merekam data yang harus secured seperti misalnya `account` dan `password`, REST akan melakukan hashing terhadap data tersebut sebelum direkam. Jika kemudian ada request terhadap data tersebut, maka REST akan meminta sebuah data sebagai validator untuk di-hash dan dibandingkan dengan data yang terekam.

Subversion ini akan melayani request dari `frontend` yang terkait dengan users. Yaitu salah satu aktor dari aplikasi ini sebagai sebuah system. ID dan attributes lain yang melekat kepadanya.

Pengembangan setiap routes dan middleware-nya alias API harus sesuai ketentuan berikut ini:

0. Jika membutuhkan data terstruktur, data disediakan dengan perancangan terlebih dahulu. Pembentukan relational table untuk entitas yang sesuai dengan permintaan `frontend`.
1. Perancangan routes.
2. Pembuatan routes hasil rancangan beserta middleware-nya.
3. Dokumentasi routes di `routes.html`

## New Subversion

```bash
$ # project-root
$ cp -rf projects/ae-utilities/ projects/af-users
```

Pada subversion baru ini, saya mulai membutukan alat untuk merancang schema (secara umum disebut basisdata, untuk relational database/rdB, acapkali disebut dengan istilah yang lebih khusus, yaitu schema).

Saya mencoba untuk browsing ke sana kemari, akhirnya saya menemukan alat yang tepat dan praktis untuk pembuatan relational scheme diagram. Online, gratis, multi-type export, code-based. Features yang sesuai dengan urutan pengembangan, baik untuk dokumentasi dan mengurangi kesalahan akibat tidak teliti dalam perancangan, typo, dan sebagainya.

Feature yang terakhir adalah feature yang paling menarik. Yaitu `CODE-BASED`. Sangat mempermudah untuk proses pembentukan rancangan potongan-potongan diagram untuk relational schema.

Situsnya di `https://dbdiagram.io/d`.

Karena dirancang untuk MySQL dan PostgreSQL database engine sekaligus, alat ini hanya memberikan hasil export berupa SQL yang telanjang, tanpa CONSTRAINTS dan penetapan dbEngine type yang lengkap. Akibatnya, saya tidak bisa menggunakan SQL-nya secara langsung sebagai pembentuk schema. Harus melalui alat lain (MySQL Workbench).

MySQL Workbench lebih sering saya gunakan sebagai alat untuk mememberikan dummy data kepada schema yang terbentuk dan melakukan pengujian atas semua SQLs yang akan saya pergunakan di middleware.

MySQL Workbench saya peroleh dari official site MySQL.

**`21:30`**