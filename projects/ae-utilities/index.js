'use strict';

var app = require('express')(),
    express = require('express'),
    port = process.env.PORT || 3000,
    bodyParser = require('body-parser'),
    routes = require('./routes'),
    path = require('path');

global.staticBase = path.resolve(__dirname + '/public');
app.use(express.static(staticBase));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.use('/', routes);

app.listen(port, () => {
    console.log('');
    console.log('"BPR" Field Working Performance System');
    console.log('RESTful API Server run di PORT: ' + port);
});