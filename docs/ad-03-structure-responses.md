# ad-03-structure-responses.md

`Selasa, 16 Juli 2019`

**`19:50`**

Aplikasi sebaiknya menyediakan sebuah routine untuk 'pintu keluar' hasil middleware. Optional, dapat digunakan atau tidak digunakan oleh middleware yang ada di dalam aplikasi.

0. Generate

    ```bash
    $ # app-root
    $ touch responses.js
    ```

    `responses.js`

    ```javascript
    'use strict';

    exports.ok = function(values, res) {
        var data = {
            'status': 200,
            'values': values
        };
        res.json(data);
        res.end();
    };

    exports.ops = function(values, res) {
        var data = {
            'status': 999,
            'values': values
        };
        res.json(data);
        res.end();
    };
    ```

    Sementara ada 2 buah methods tersedia. `ok`, jika request sukses dan `ops`, jika request failure.

    Semua response bertype JSON agar penanganan di client menjadi standard.

1. Selesai

**`19:56`**
