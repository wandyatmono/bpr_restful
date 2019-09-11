# af-01-users-all.md

`Kamis, 19 Juli 2019`

**`21:48`**

**`22:08`**

**`22:15`**

0. Route to `/users`

    `/routes/core/index.js`

    ```javascript
    'use-strict';

    var core = require('express').Router(),
        users = require('./users');

    core.use('/users', users);

    core.get('/', (req, res) => {
        res.sendFile(__dirname + '/public/routes.html');
    });

    module.exports = core;
    ```

1. Route of `/users`

    ```bash
    $ #app-root
    $ mkdir routes/core/users && touch routes/core/users/index.js
    ```

    ```javascript
    'use-strict';

    var users = require('express').Router(),
        all = require('./all.js');

    users.get('/all', all);

    users.get('/', (req, res) => {
        res.sendFile(__dirname + '/public/routes.html');
    });

    module.exports = users;
    ```

2. Middleware

    ```bash
    $ touch routes/core/users/all.js
    ```