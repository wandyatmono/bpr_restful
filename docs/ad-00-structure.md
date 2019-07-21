# ad-00-structure.md

`Selasa, 16 Juli 2019`

**`10:57`**

Routing is hard katanya, tapi saya akan mencoba membuat arsitektur aplikasi yang routingnya lebih rapi. Pengetahuan dan pemahamannya diperoleh dari gresek-gresek kesana-kemari. Tetapi inspirator utamanya adalah [tutorial ini](https://scotch.io/tutorials/keeping-api-routing-clean-using-express-routers) dan tutorial ini telah saya buat menjadi sistematis dalam rangka upaya pemahaman. Saya tulis di dokumentasi sebelum ini.

## Terminology

Walaupun hanya berupa konvensi, terms yang saya catat ini penting dalam konteks pengembangan sebuah API.

**Application** ini disebut sebagai **RESTful API**. 

Element penting dalam sebuah API adalah **route** yang akan mengarahkan proses ke sebuah **middleware**, element dari aplikasi yang akan mengerjakan request dari client. Karena ada banyak kemungkinan request dan type-nya, maka perlu disediakan banyak **routes**

Types of request contohnya GET, POST, PUT, PATCH, DELETE, dan sebagainya.

Sesuai separation of concern, middlewares dapat dipecah dan dikelompokkan. Akibatnya semua routes yang mengarahkan ke setiap middlewares-pun harus dirancang sedemikian rupa agar sesuai dengan tujuan dan struktur separation yang dilakukan. Biasanya pengelompokan yang dilakukan akan membentuk sebuah struktur directory tree.

Titik akhir sebuah route secara otomatis akan menjadi **holder** dari middleware yang dituju oleh route. Titik akhir tersebut dapat disebut **end-point** dan route antara yang berada di antara router 'root' dan end-point dapat disebut sebagai **base-point**.

## New Subversion

    ```bash
    $ # project root
    $ mkdir projects/ad-structure
    ```

**`11:14`**