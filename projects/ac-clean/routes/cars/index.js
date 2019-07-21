const cars = require('express').Router();
const all = require('./all');
const single = require('./single');
const data = require('../../data.json');
const findObject = require('../utils/findObject');

cars.param('carId', findObject('car'));

cars.param('carId', (req, res, next, value) => {
    const car = data.cars.find(c => c.id === (value * 1));

    if (car) {
        req['car'] = car;
        next();
    } else {
        res.status(404).send('Invalid car ID');
    }
});

cars.get('/:carId', single);

cars.get('/', all);

module.exports = cars;