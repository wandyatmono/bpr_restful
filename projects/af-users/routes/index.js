'use strict';

var routes = require('express').Router(),
    core = require('./core'),
    utilities = require('./utilities');

routes.use('/utilities', utilities);

routes.use('/core', core);

routes.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

routes.get('*', (req, res) => {
    res.sendFile(staticBase + '/error.html');
});

module.exports = routes;