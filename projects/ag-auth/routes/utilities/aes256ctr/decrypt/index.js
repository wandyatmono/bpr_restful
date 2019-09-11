'use-strict';

var decrypt = require('express').Router(),
    middleware = require('./decrypt.js');

decrypt.get('/:data', middleware);

decrypt.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = decrypt;