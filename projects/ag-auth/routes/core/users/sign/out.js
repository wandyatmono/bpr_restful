'use-strict';

var db = require('../../../../connection');

module.exports = (req, res) => {
    account = req.params.account;
    password = req.params.password;
    res.send('signout with: ' + account + ' and ' + password + '?!');
}