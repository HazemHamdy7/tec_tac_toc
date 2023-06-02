const mongoose = require ('mongoose');
const playerSchema = require('./player');

const roomSchema = new mongoose.Schema({
  occupancy: {
    type: Number,
    default: 2,
  },
  maxRounds: {
    type: Number,
    default: 6,
  },
  currenRound: {
    required: true,
    type: Number,
    default: 1,
  },

  palyers: [playerSchema],
  isJoin: {
    type: Boolean,
    default: true,
  },

  turn: playerSchema,
  turnIndex: {
    type: Number,
    default: 0,
  },
});



const roomModel = mongoose.model('Room' , roomSchema);
module.exports = roomModel;