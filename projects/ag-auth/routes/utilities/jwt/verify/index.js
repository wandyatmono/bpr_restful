'use-strict';

var verify = require('express').Router(),
    middleware = require('./api.js');

encrypt.get('/:data', middleware);

encrypt.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = verify;