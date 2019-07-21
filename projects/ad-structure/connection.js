var mysql = require('mysql');

var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'emd230661',
    database: 'bpr'

});

db.connect(function (err) {
    if (err) throw error;
});

module.exports = db;