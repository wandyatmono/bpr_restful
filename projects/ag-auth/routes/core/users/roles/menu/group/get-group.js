'use-strict';

var db = require('../../../../../../connection');

module.exports = (req, res) => {
    var sql = 'SELECT * ' +
        'FROM (' +
        'SELECT ' +
        'rdg.id AS id, rdg.name ' +
        'FROM role_duties AS rd ' +
        'JOIN role_duty_list AS rdl ' +
        'ON rd.role = ? ' +
        'AND rd.item = rdl.id ' +
        'JOIN role_duty_groups AS rdg ' +
        'ON rdl.group = rdg.id ' +
        'GROUP BY rdg.id ' +
        ') AS id ' +
        'ORDER BY id;';
    db.query(
        sql,
        [req.params.role_id],
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                res.send(rows)
            }
        }
    );
};