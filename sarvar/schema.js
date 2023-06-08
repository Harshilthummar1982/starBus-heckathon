const mongoose = require('mongoose');

const stationdb = new mongoose.Schema({
    name: {
        type: String,
    },
    lat: {
        type: String,
    },
    lon: {
        type: String,
    },
    stopNo: {
        type: Number,
    }
})

const station = mongoose.model('stations', stationdb);
module.exports = station;

