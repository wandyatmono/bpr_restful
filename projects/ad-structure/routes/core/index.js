'use-strict';

var core = require('express').Router()

core.get('/', (req, res) => {
    res.send('/core - Connected!');
});

module.exports = core;