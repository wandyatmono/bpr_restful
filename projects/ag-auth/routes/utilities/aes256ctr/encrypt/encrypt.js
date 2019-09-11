'use-strict';

var Cryptr = require('cryptr');
const cryptr = new Cryptr('joko@wandyatmono');

module.exports = (req, res) => {
    encrypted = cryptr.encrypt(req.params.data);
    res.status(200).json({ encrypted });
};