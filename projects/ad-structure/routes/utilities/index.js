'use-strict';

var utilities = require('express').Router()

utilities.get('/', (req, res) => {
    res.send('/utilities - Connected!');
});

module.exports = utilities;