'use-strict';

var db = require('../../../../../connection');

module.exports = (req, res) => {
    var sql = 'SELECT ' +
        'rdg.id AS id, rd.item, rdl.route, rd.rights, rdl.name, rdl.icon, rdl.explanation ' +
        'FROM role_duties AS rd ' +
        'JOIN role_duty_list AS rdl ' +
        'ON rd.role = ? ' +
        'AND rd.item = rdl.id ' +
        'JOIN role_duty_groups AS rdg ' +
        'ON rdl.group = rdg.id ' +
        'ORDER BY rdg.id ASC; '; 
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