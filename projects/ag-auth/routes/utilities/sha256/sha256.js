'use-strict';

var sha256 = require('js-sha256').sha256;

module.exports = (req, res) => {
    hash = sha256(req.params.data);
    res.status(200).json({ hash });
};