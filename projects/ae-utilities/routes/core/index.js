'use-strict';

var core = require('express').Router();

core.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = core;