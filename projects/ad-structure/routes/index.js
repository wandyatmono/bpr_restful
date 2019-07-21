'use strict';

var routes = require('express').Router(),
    core = require('./core'),
    utilities = require('./utilities');

routes.use('/utilities', utilities);

routes.use('/core', core);

routes.get('/', (req, res) => {
    res.send("Hello from the RESTful API Server!");
});

module.exports = routes;