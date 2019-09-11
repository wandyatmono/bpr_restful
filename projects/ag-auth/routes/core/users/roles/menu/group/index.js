'use-strict';

var group = require('express').Router(),
    middleware = require('./get-group.js');

group.get('/:role_id', middleware);

group.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = group;