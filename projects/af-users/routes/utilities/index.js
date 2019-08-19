'use-strict';

var utilities = require('express').Router(),
    sha256 = require('./sha256'),
    uuid = require('./uuid'),
    aes256ctr = require('./aes256ctr');

utilities.use("/aes256ctr", aes256ctr);

utilities.use("/uuid", uuid);

utilities.use("/sha256", sha256);

utilities.get('/', (req, res) => {
    res.sendFile(staticBase + '/routes.html');
});

module.exports = utilities;