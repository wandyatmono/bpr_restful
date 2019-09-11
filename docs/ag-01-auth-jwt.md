# ag-00-auth.md

`Senin, 26 Agustus 2019`

**`12:30`**

## New Subversion

```bash
$ # project-root
$ cp -rf projects/af-users/ projects/ag-auth
```

Saat pengembangan `frontend` mulai masuk ke urusan authentikasi. Di `backend` harus sudah mulai dikembangkan layanan untuk pembentukan dan verifikasi JSON Web Token alias JWT.

## Package

```bash
$ # app-root
$ npm install jsonwebtoken --save
```

## Signin 

Proses sign-in adalah sebuah proses direkamnya id seorang user sebagai orang yang berhak untuk melakukan aktivitas dengan aplikasi untuk jangka waktu tertentu sampai yang bersangkutan menyatakan sign-out. Selama jangka waktu tersebut, user
## Routes

<p align="center">
    <img src="./figures/au-00-a-routes.png" width="100%" />
    <br />Figure: au-00-a-routes.png
</p>

```bash
# wandyatmono@ubuntu-devenvo:~/projects/bpr/restful/projects/ag-auth/routes$
$ mkdir utilities/jwt
$ touch utilities/jwt/index.js
$ mkdir utilities/jwt/sign
$ touch utilities/jwt/sign/index.js
$ touch utilities/jwt/sign/api.js
$ mkdir utilities/jwt/verify
$ touch utilities/jwt/verify/index.js
$ touch utilities/jwt/verify/api.js
```

`touch utilities/jwt/index.js`

```javascript

```

`touch utilities/jwt/sign/index.js`

```javascript

```

`touch utilities/jwt/sign/api.js`

```javascript

```

`touch utilities/jwt/verify/index.js`

```javascript

```

`touch utilities/jwt/verify/api.js`

```javascript

```


**`21:30`**