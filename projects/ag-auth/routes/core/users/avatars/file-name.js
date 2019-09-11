'use-strict';

var db = require('../../../../connection'),
    beautify = require("json-beautify");

module.exports = (req, res) => {
    query = 'SELECT * ' +
        'FROM user_avatars AS a ' +
        'WHERE a.user = ' + req.params.id + ';';
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