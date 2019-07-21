'use-strict';

var core = require('express').Router(),
    users = require('./users');

core.use('/users', users);

core.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = core;