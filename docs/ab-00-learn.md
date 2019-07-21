# ab-00-learn.md

`Minggu, 14 Juli 2019`

**`16:40`**

Project telah diinisialisasi. Berikutnya akan dibuat subversion pertama dengan nama `ab-learn`. Sesuai namanya, subversion ini `ab-learn` khusus dibuat untuk belajar dan pengingatan kembali, sebelum pengembangan yang sesuai dengan real-world.

Agar flexible. Terutama untuk mempermudah pelacakan perubahan code saat proyek ini dipelajari ulang oleh diri saya sendiri maupun orang lain yang membutuhkan, proyek saya bagi menjadi direktori-direktori. Sebuah direktori adalah sebuah subversion.

Keunikan dari cara subversion ini adalah; `node_modules` tetap diletakkan di parent semua direktori subversion (projects-root). NPM site menjanjikan, jika `node_modules` tidak diketemukan di direktori proyek, akan ada mekanisme pencarian terhadap gudang libraries tersebut dengan cara menelusur ke atas. Mulai dari parent, terus naik menuju ke system root directory.

Penomoran subversion menggunakan cara penamaan column pada ancient LOTUS 123 dengan lowercase + dash + topic.

**`16:49`**
