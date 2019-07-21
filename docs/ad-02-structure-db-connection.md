# ad-02-structure-db-connection.md

`Selasa, 16 Juli 2019`

**`15:15`**

Connector ke database management system engine (MySQL) diletakkan di root

0. Generate

    ```bash
    $ # app-route
    $ touch connection.js
    ```

    `connection.js`

    ```javascript
    var mysql = require('mysql');

    var db = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : 'emd230661',
        database : 'bpr'

    });

    db.connect(function (err){
        if (err) throw error;
    });

    module.exports = db;
    ```

1. Selesai, siap digunakan oleh middleware.

**`15:20`**