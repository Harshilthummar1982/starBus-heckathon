const mongoose = require('mongoose');
const runningBusDb = new mongoose.Schema({
    srNo: {
        type: Number,
    },
    root: {
        tyoe: Array,
    },
    via: {
        tyoe: Array,
    },
    status: {
        type: Boolean,
    },
    busNumber: {
        type: String,
    },

})

const runningBus = mongoose.model('runningbuses', runningBusDb);
module.exports = runningBus;