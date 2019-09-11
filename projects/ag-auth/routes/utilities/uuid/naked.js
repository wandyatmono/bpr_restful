'use-strict';

var uuid = require('uuid-random');

module.exports = (req, res) => {
    hash = uuid();
    res.status(200).json({ hash });
};