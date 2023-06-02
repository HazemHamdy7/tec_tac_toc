const mongoose = require ('mongoose');

const playerSchema = new mongoose.Schema({
    occupancy :{
        type : String,
       trim : true,

    },
    socketsID :{
        type : String,
    },
    points :{
        type    :Number,
        default : 0,    
    },
    playerType :{
        required : true,
    }
   
});
   module.exports = playerSchema;