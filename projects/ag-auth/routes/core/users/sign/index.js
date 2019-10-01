'use-strict';

var sign = require('express').Router();

var middlewareIn = require('./in.js');
var middlewareOut = require('./out.js');

sign.post('/in/:account/:password/:footprint', middlewareIn);

sign.post('/out/:account/:password/:footprint', middlewareOut);

sign.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = sign;