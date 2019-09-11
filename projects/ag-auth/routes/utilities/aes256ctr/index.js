'use-strict';

var aes256ctr = require('express').Router(),
    encrypt = require('./encrypt'),
    decrypt = require('./decrypt');

aes256ctr.use('/encrypt', encrypt);

aes256ctr.use('/decrypt', decrypt);

aes256ctr.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = aes256ctr;