'use-strict';

var encrypt = require('express').Router(),
    middleware = require('./encrypt.js');

encrypt.get('/:data', middleware);

encrypt.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = encrypt;