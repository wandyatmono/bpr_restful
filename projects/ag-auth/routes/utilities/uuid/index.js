'use-strict';

var uuid = require('express').Router(),
    naked = require('./naked');

uuid.get('/naked', naked);

uuid.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = uuid;