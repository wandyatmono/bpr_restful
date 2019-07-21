'use strict';

module.exports = function (app) {
    var path = require('./controller');

    app.route('/')
        .get(path.index);

    app.route('/users')
        .get(path.users);

    app.route('/users/:user_id')
        .get(path.findUser);

    app.route('/users')
        .post(path.createUser);

    app.route('/users')
        .put(path.updateUser);

    app.route('/users')
        .delete(path.deleteUser);

    app.route('/sha256/:data')
        .get(path.sha256);

    app.route('/uuid')
        .get(path.uuid);

};