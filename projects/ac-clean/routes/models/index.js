const models = require('express').Router();
const all = require('./all');
const single = require('./single');
const cars = require('./cars');
const data = require('../../data.json');
const findObject = require('../utils/findObject');

models.param('modelId', findObject('model'));

models.param('modelId', (req, res, next, value) => {
    const model = data.models.find(m => m.id === (value * 1));

    if (model) {
        req['model'] = model;
        next();
    } else {
        res.status(404).send('Invalid model ID');
    }
});

models.use('/:modelId/cars', cars);

models.get('/:modelId', single);

models.get('/', all);

module.exports = models;