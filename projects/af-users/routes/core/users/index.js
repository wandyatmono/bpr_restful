'use-strict';

var users = require('express').Router(),
    all = require('./all.js'),
    allLimit = require('./all-pagination'),
    singleId = require('./single-id.js'),
    avatars = require('./avatars'),
    logs = require('./logs');

users.use('/logs', logs);

users.use('/avatars', avatars);

users.get('/all', all);

users.get('/:fromAfter/:asManyAs', allLimit);

users.get('/:id', singleId);

users.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = users;