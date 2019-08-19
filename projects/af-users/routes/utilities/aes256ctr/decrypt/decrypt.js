'use-strict';

var Cryptr = require('cryptr');
const cryptr = new Cryptr('joko@wandyatmono');

module.exports = (req, res) => {
    try {
        decrypted = cryptr.decrypt(req.params.data);
    } catch (ex) {
        decrypted = "Ops, Bad input string!";
    }
    res.status(200).json({ decrypted });
};