# af-05-users-update-routes-html.md

`Minggu, 21 Juli 2019`

**`21:37`**

Pembenahan alias normalisasi dilakukan terhadap routes. Dan kemudian 'dilaporkan' ke `routes.html`.

0. Perubahan routes dari `/routes/core/users/single-id/:id` menjadi `/routes/core/users/:id`

    `/routes/core/users/index.js`

    ```javascript
    'use-strict';

    var users = require('express').Router(),
        all = require('./all.js'),
        allLimit = require('./all-pagination'),
        singleId = require('./single-id.js'),
        avatars = require('./avatars');

    users.get('/all/:fromAfter/:asManyAs', allLimit);

    users.get('/all', all);

    users.use('/avatars', avatars);

    users.get('/:id', singleId);

    users.get('/', (req, res) => {
        res.sendFile(staticBase + '/routes.html');
    });

    module.exports = users;
    ```

1. Perubahan routes dari `/routes/core/users/all/:fromAfter/:asManyAs` ke `/routes/core/users/:fromAfter/:asManyAs`

    `/routes/core/users/index.js`

    ```javascript
    'use-strict';

    var users = require('express').Router(),
        all = require('./all.js'),
        allLimit = require('./all-pagination'),
        singleId = require('./single-id.js'),
        avatars = require('./avatars');

    users.use('/avatars', avatars);

    users.get('/all', all);

    users.get('/:fromAfter/:asManyAs', allLimit);

    users.get('/:id', singleId);

    users.get('/', (req, res) => {
        res.sendFile(staticBase + '/routes.html');
    });

    module.exports = users;
    ```

2. Perubahan routes `/routes/core/users/avatars`

    `/routes/core/users/avatars/index.js`

    ```javascript
    'use-strict';

    var avatars = require('express').Router(),
        fileName = require('./file-name.js'),
        image = require('./image.js');

    avatars.get('/:id/:size', image);

    avatars.get('/:id', fileName);

    avatars.get('/', (req, res) => {
        res.sendFile(staticBase + '/routes.html');
    });

    module.exports = avatars;
    ```

3. Dilaporkan ke `routes.html`

    ```html
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <title>RESTful API</title>
        <base href="/">

        <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="cache-control" content="no-cache, must-revalidate, post-check=0, pre-check=0">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="pragma" content="no-cache">
        <link rel="icon" type="image/x-icon" href="images/favicon.ico">
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Roboto', sans-serif;
            }
        
            .pad16 {
                padding: 16px;
            }
        
            .paragraph {
                padding: 5px;
                border: 1px solid rgb(158, 158, 158);
                margin-bottom: 5px;
            }
        
            .paragraph.radius-5 {
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
                border-radius: 5px;
            }
        
            .sibling {
                padding-left: 32px;
                background-image: url("images/sibling.png");
                background-repeat: no-repeat;
            }
        
            .end {
                padding-left: 32px;
                background-image: url("images/end.png");
                background-repeat: no-repeat;
            }
        
            .continue {
                padding-left: 32px;
                background-image: url("images/continue.png");
                background-repeat: no-repeat;
            }
        
            .space {
                width: 32px;
            }
        
            .flex {
                display: flex;
            }
        </style>
    </head>

    <body>
        <div class="pad16">
            <h2>Routes</h2>
            <div class="pad16 paragraph radius-5">
                /
                <div class="sibling">/core</div>
                <div class="flex">
                    <div class="continue"></div>
                    <div class="end">/users</div>
                </div>
                <div class="flex">
                    <div class="continue"></div>
                    <div class="space"></div>
                    <div class="sibling">/:id</div>
                </div>
                <div class="flex">
                    <div class="continue"></div>
                    <div class="space"></div>
                    <div class="sibling">/:fromAfter/:asManyAs</div>
                </div>
                <div class="flex">
                    <div class="continue"></div>
                    <div class="space"></div>
                    <div class="end">/all</div>
                </div>
                <div class="flex">
                    <div class="continue"></div>
                    <div class="space"></div>
                    <div class="space"></div>
                    <div class="end">/avatars</div>
                </div>
                <div class="flex">
                    <div class="continue"></div>
                    <div class="space"></div>
                    <div class="space"></div>
                    <div class="space"></div>
                    <div class="sibling">/:id/:size</div>
                </div>
                <div class="flex">
                    <div class="continue"></div>
                    <div class="space"></div>
                    <div class="space"></div>
                    <div class="space"></div>
                    <div class="end">/:id</div>
                </div>
                <div class="end">/utilities</div>
                <div class="flex">
                    <div class="space"></div>
                    <div class="sibling">/sha256</div>
                </div>
                <div class="flex">
                    <div class="space"></div>
                    <div class="continue"></div>
                    <div class="end">/:data</div>
                </div>
                <div class="flex">
                    <div class="space"></div>
                    <div class="end">/uuid</div>
                </div>
                <div class="flex">
                    <div class="space"></div>
                    <div class="space"></div>
                    <div class="end">/naked</div>
                </div>
            </div>
        </div>
    </body>
    ```

**`22:25`**