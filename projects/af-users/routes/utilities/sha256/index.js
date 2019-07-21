'use-strict';

var sha256 = require('express').Router(),
    middleware = require('./sha256.js');

sha256.get('/:data', middleware);

sha256.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = sha256;