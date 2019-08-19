USE
	bpr_users;
SELECT
	ul.id AS id,
	ul.user AS userId,
	u.name AS userName,
	u.account AS userAccount,
	ul.state AS userState,
	u.role AS roleId,
	ur.name AS roleName,
	u.last_latitude AS lastLatitude,
	u.last_longitude AS lastLongitude,
	u.online,
	u.last_activity AS lasActivity,
	ul.hidden,
	u.notifications,
	u.chats
FROM
	user_logs AS ul
JOIN
	users AS u
ON
	ul.user=u.id AND ul.uuid='f7b7bafd-ecb0-4a31-96b9-e7a610675624'
JOIN
	user_roles AS ur
ON
	u.role = ur.id
ORDER BY
	ul.state DESC;

/*
    id: number;
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