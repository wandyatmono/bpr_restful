'use-strict';

var menu = require('express').Router(),
    middleware = require('./get-menu.js'),
    group = require('./group');

menu.use('/group', group);

menu.get('/:role_id', middleware);

menu.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = menu;