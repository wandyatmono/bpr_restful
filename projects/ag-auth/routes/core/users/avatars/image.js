'use-strict';

var db = require('../../../../connection'),
    jimp = require('jimp');

function getFileName(id) {

    imgPath = staticBase + '/media/images/photos/profiles/avatars/';

    return new Promise(resolve => {
        var query = 'SELECT photo ' +
                    'FROM user_avatars ' +
                    'WHERE user = ? && actived = 0;';
        db.query(query,
            [id],
            function (error, rows, fields) {
                if (rows.length === 0) {
                    resolve(404);
                } else {
                    resolve(imgPath + rows[0].photo);
                }
            }
        );
    });
}

function avatarBuffer(avatar, avatarWidth, avatarHeight) {

    return new Promise(resolve => {
        jimp.read(avatar, (err, avatar) => {
            if (err) throw err;
            avatar
                .resize(avatarWidth, avatarHeight)
                .quality(60)
            avatar.getBuffer(avatar._originalMime, (err, buffer) => {
                if (err) reject(err)
                resolve(buffer)
            })

        });
    });
}

module.exports = async (req, res) => {

    var id = req.params.id;
    var size = req.params.size;

    let fileName = await getFileName(id);

    let avatarWidth = 0;
    let avatarHeight = 0;

    switch (size) {
        case 'S': {
            avatarWidth = 28;
            avatarHeight = 28;
            break;
        }
        case 'M': {
            avatarWidth = 48;
            avatarHeight = 48;
            break;
        }
        case 'L': {
            avatarWidth = 64;
            avatarHeight = 64;
            break;
        }
        case 'XL': {
            avatarWidth = 128;
            avatarHeight = 128;
            break;
        }
        case 'XXL': {
            avatarWidth = 256;
            avatarHeight = 256;
            break;
        }

    }

    if (fileName === 404) {
        res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
        return res.end('404');
    } else {
        let avatar = await avatarBuffer(fileName, avatarWidth, avatarHeight);
        res.writeHead(200, { 'Content-Type': 'image/jpg' });
        res.end(avatar);
    }
};