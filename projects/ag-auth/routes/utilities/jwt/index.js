'use-strict';

var jwt = require('express').Router(),
    sign = require('./sign'),
    verify = require('./verify');

jwt.use('/sign', sign);

jwt.use('/verify', verify);

jwt.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = jwt;