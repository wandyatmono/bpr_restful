'use strict';

exports.ops = function (values, res) {
    var data = {
        'status': 999,
        'values': values
    };
    res.json(data);
    res.end();
};

exports.ok = function (values, res) {
    var data = {
        'status': 200,
        'values': values
    };
    res.json(data);
    res.end();
};