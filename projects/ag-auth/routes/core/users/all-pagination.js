'use-strict';

var db = require('../../../connection'),
    beautify = require("json-beautify");

module.exports = (req, res) => {
    query = 'SELECT ' +
        'u.id, u.name, u.account, u.password, u.role, r.name AS position, ' +
        'u.ric, u.bank_acc, u.birth_place, u.birth_date, gender, ' +
        'a.photo AS avatar, a.actived ' +
        'FROM bpr.users AS u ' +
        'JOIN bpr.roles AS r ' +
        'JOIN bpr.avatars AS a ' +
        'ON u.role = r.code ' +
        'AND u.id = a.user ' +
        'ORDER BY u.id ' +
        'LIMIT ' + req.params.fromAfter + ',' + req.params.asManyAs;
    db.query(
        query, function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                res.header("Content-Type", 'application/json');
                res.send(beautify(rows, null, 2, 50));
            }
        }
    );
};