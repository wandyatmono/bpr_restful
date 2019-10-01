'use-strict';

var db = require('../../../../connection'),
    sha256 = require('js-sha256').sha256;

function matcher(accIn, passwIn) {

    return new Promise(resolve => {
        var query = 'SELECT id ' +
            'FROM users ' +
            'WHERE account = ? AND password = ?;';
        db.query(query,
            [accIn, passwIn],
            function (error, rows, fields) {
                if (rows.length === 0) {
                    resolve(404);
                } else {
                    resolve(rows[0]);
                }
            }
        );

    });
}

function logCheck(id) {
    
    return new Promise(resolve => {
        var query = 'SELECT * ' +
            'FROM user_logs ' +
            'WHERE user = ?;';
        db.query(query,
            [id],
            function (error, rows, fields) {
                if (rows.length === 0) {
                    resolve(404);
                } else {
                    resolve(rows);
                }
            }
        );

    });
    
}

function saveNewLog(uuid, user, state, hidden) {

    return new Promise(resolve => {
        var query = "INSERT INTO user_logs " + 
            "(uuid, user, state, hidden) " +
            "VALUES (?, ?, ?, ?);";
        db.query(query,
            [uuid, user, state, hidden],
            function (error, rows, fields) {
                resolve(true);
            }
        );

    });

}

function verifyLog(uuid, id) {
    return new Promise(resolve => {
        let activeAgent = userLog
            .find(el => el.uuid === uuid && el.user === id) ? true : false;
        let otherAgent = userLog
            .find(
                el =>
                    el.uuid !== uuid &&
                    el.user === id &&
                    el.state === 0
            ) ? true : false;
        resolve({ activeAgent, otherAgent });
    });
}

function changeLogState(uuid, user) {

    return new Promise(resolve => {
        var query = "UPDATE user_logs " +
            "SET uuid = ?, user = ? " +
            "WHERE " +
            "uuid = " + uuid + " AND " +
            "user = " + user + ";";
        db.query(query,
            [uuid, user],
            function (error, rows, fields) {
                resolve(true);
            }
        );

    });
}

function otherMustSignout(uuid, user) {

    return new Promise(resolve => {
        var query = "UPDATE user_logs " +
            "SET state = 1 " +
            "WHERE uuid = ?  AND user <> ?;";
        db.query(query,
            [uuid, user],
            function (error, rows, fields) {
                resolve(true);
            }
        );

    });
}

module.exports = async (req, res) => {
    let matchedUser = await matcher(
        sha256('emd-' + req.params.account), 
        sha256('emd-' + req.params.password)
    );
    if (matchedUser === 404) {
        res.send(false);
    } else {
        userLog = await logCheck(matchedUser.id);
        if (userLog === 404) {
            let newLog = await saveNewLog(
                req.params.footprint,
                matchedUser.id,
                0,
                1
            );
            let finalProcess = await otherMustSignout(req.params.footprint, matchedUser.id);
            res.send(true);
        } else {
            let userLog = await verifyLog(req.params.footprint, matchedUser.id);
            if (userLog.activeAgent === true && userLog.otherAgent === true) {
                res.send('clarify');
            } else {
                if (userLog.activeAgent === true && userLog.otherAgent === false) {
                    let changeLog = await changeLogState(req.params.footprint, matchedUser.id);
                    let finalProcess = await otherMustSignout(req.params.footprint, matchedUser.id);
                    res.send(true);
                } else {
                    let newLog = await saveNewLog(
                        req.params.footprint,
                        matchedUser.id,
                        0,
                        1
                    );
                    let finalProcess = await otherMustSignout(req.params.footprint, matchedUser.id);
                    res.send(true);
                }

            }
        }
    }

}