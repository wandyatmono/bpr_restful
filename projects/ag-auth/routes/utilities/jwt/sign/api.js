'use-strict';

var jwt = require('jsonwebtoken');
const secret = 'joko@wandyatmono';

module.exports = (req, res) => {
    token = jwt.sign(req.params.data);
    res.status(200).json({ encrypted });
};