'use-strict';

var logs = require('express').Router();

var middleware = require('./logs.js');

logs.get('/:uuid', middleware);

logs.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = logs;