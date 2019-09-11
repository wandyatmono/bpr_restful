'use-strict';

var avatars = require('express').Router(),
    fileName = require('./file-name.js'),
    image = require('./image.js');

avatars.get('/:id/:size', image);

avatars.get('/:id', fileName);

avatars.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = avatars;