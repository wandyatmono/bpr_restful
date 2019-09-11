'use-strict';

var roles = require('express').Router(),
    menu = require('./menu');

roles.use('/menu', menu);

roles.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = roles;