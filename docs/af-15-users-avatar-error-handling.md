# Get Single Avatar

`Minggu, 21 Juli 2019`

**`20:46`**

> LAST NOTE
>
> Saya belum dapat mengatasi jika API controller ini mengalami 'not-found'. Sebab MySQL tidak throwing error sehingga saat logic melangkah lebih jauh akan terjadi non mysql error.

Jika `non mysql error` terjadi, berarti RESTful API Server akan menghentikan layanannya sampai dengan dibenahi dan tentu saja akan berakibat pada kinerja frontend application. Untuk itu error events harus diamankan. Secara teknis dibuat seolah tidak terjadi error. Middleware tetap akan memberikan sebuah value.

## Mengamankan Error Events

0. Update `getFileName()`

    `/routes/core/users/avatars/image.js` snippet

    ```javascript
    function getFileName(id) {

        imgPath = staticBase + '/media/images/photos/profiles/avatars/';

        return new Promise(resolve => {
            var query = 'SELECT photo ' +
                        'FROM avatars ' +
                        'WHERE user = ? && actived = 0;';
            db.query(query,
                [id],
                function (error, rows, fields) {
                    if (rows.length === 0) {
                        resolve(404);
                    } else {
                        resolve(imgPath + rows[0].photo);
                    }
                }
            );
        });
    }
    ```

    Deteksi error tidak menggunakan 'error' dari `db.query` tetapi dengan pengujian terhadap `rows`, **kosong** ataukah tidak. Dan tetap me-resolve sesuatu.

    ```javascript
                    if (rows.length === 0){
                        resolve(404);
                    }
    ```

1. returning `text/html`

    `/routes/core/users/avatars/image.js` snippet

    ```javascript
    if (fileName === 404) {
        res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8' });
        return res.end('404');
    } else {
        let avatar = await avatarBuffer(fileName, avatarWidth, avatarHeight);
        res.writeHead(200, {'Content-Type': 'image/jpg' });
        res.end(avatar);
    }
    ```

    Jika terjadi error, sebelum 'mengambil image buffer, proses dihentikan dengan cara langsung melakukan returning `res.end` dengan sembarang data (`'404'`) dan dengan content type '`text/html`'.

    Dengan cara ini, RESTful API Server tidak terhenti dan frontend tetap menerima data walau data yang bersangkutan adalah data yang salah.

    Sumber: https://stackify.com/node-js-error-handling/

**`21:33`**