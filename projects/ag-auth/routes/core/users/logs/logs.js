'use-strict';

var db = require('../../../../connection');

module.exports = (req, res) => {
    var uuid = req.params.uuid;
    var sql =   'SELECT ' +
                '   ul.id AS id, ' +
                '   ul.user AS userId, ' +
                '   u.name AS userName, ' +
                '   u.account AS userAccount, ' +
                '   ul.state AS userState, ' +
                '   u.role AS roleId, ' +
                '   ur.name AS roleName, ' +
                '   u.last_latitude AS lastLatitude, ' +
                '   u.last_longitude AS lastLongitude, ' +
                '   u.online, ' +
                '   u.last_activity AS lastActivity, ' +
                '   ul.hidden, ' +
                '   u.notifications, ' +
                '   u.chats ' +
                'FROM ' +
                '   user_logs AS ul ' +
                'JOIN ' +
                '   users AS u ' +
                'ON ' +
                '   ul.user = u.id AND ul.uuid = ? ' +
                'JOIN ' +
                '   user_roles AS ur ' +
                'ON ' +
                '   u.role = ur.id ' +
                'ORDER BY ' +
                '   ul.state; ';
    db.query(
        sql,
        [ uuid ], 
        function (error, rows, fields){
            if(error){
                console.log(error)
            } else{
                res.send(rows)
            }
        }
    );
};
/*
    id: number;
    uuid: string;
    userId: number;
    userName: string;
    userAccount: string;
    userState: number;
    roleId: number;
    roleName: string;
    lastLatitude: number;
    lastLongitude: number;
    online: boolean;
    lastActivity: Date;
    hidden: boolean;
    notifications: number;
    chats: number;
*/