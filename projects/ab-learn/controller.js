'use strict';

var response = require('./response');
var db = require('./connection');
var sha256 = require('js-sha256').sha256;
var uuid = require('uuid-random');

exports.uuid = function (req, res) {
    var result = {};
    result.uuid = uuid();
    res.send(result);
};

exports.sha256 = function (req, res) {
    var result = {};
    result.data = sha256(req.params.data);
    res.send(result);
}

exports.deleteUser = function (req, res) {

    var id = req.body.id;

    db.query(
        'DELETE FROM users WHERE id = ?',
        [id],
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                response.ok("Berhasil menghapus user!", res)
            }
        }
    );
};

exports.updateUser = function (req, res) {

    var id = req.body.id;
    var role = req.body.role;
    var bank_acc = req.body.bank_acc;

    db.query(
        'UPDATE users SET role = ?, bank_acc = ? WHERE id = ?',
        [role, bank_acc, id],
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                response.ok("Berhasil merubah sebagian data user!", res)
            }
        }
    );
};

exports.createUser = function (req, res) {

    var name = req.body.name;
    var account = req.body.account;
    var password = req.body.password;
    var role = req.body.role;
    var ric = req.body.cc;
    var bank_acc = req.body.bank_acc;
    var birth_place = req.body.birth_place;
    var birth_date = req.body.birth_date;
    var gender = req.body.gender;
    var photo = req.body.photo;

    db.query(
        'INSERT INTO users (name, account, password, role, ric, bank_acc, birth_place, birth_date, gender, photo) values (?,?,?,?,?,?,?,?,?,?)',
        [name, account, password, role, ric, bank_acc, birth_place, birth_date, gender, photo],
        function (error, rows, fields) {
            if (error) {
                console.log(error)
            } else {
                response.ok("Berhasil menambahkan user!", res)
            }
        }
    );
};

function findPhone(id) {
    return new Promise(resolve => {
        var query = 'SELECT * FROM phones where user = ?';
        db.query(
            query,
            [id],
            function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    resolve(rows);
                }
            }
        );
    });
}

exports.findUser = async function (req, res) {

    var user_id = req.params.user_id;

    let phones = await findPhone(user_id);

    var query = 'SELECT * FROM users where id = ?';
    db.query(
        query,
        [user_id],
        function (error, rows, fields) {
            if (rows[0] === undefined) {
                rows[0] = "Not Found!";
                return response.ops(rows, res);
            } else {
                rows[0].phones = phones;
                return response.ok(rows, res);
            }
        }
    );
};

exports.users = function (req, res) {
    db.query('SELECT * FROM users', function (error, rows, fields) {
        if (error) {
            console.log(error)
        } else {
            response.ok(rows, res)
        }
    });
};

exports.index = function (req, res) {
    response.ok("Hello from the Node JS RESTful side!", res)
};