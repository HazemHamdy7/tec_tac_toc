const { Socket } = require('dgram');
const express = require('express');
const http = require('http');
const { connect } = require('http2');
const  mongoose = require('mongoose');


const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require('./models/room');
var io = require('socket.io')(server);

// middle ware
app.use(express.json());
// const DB ="mongodb+srv://hazem:<01152672868Hazem93>@cluster0.x2gwhn5.mongodb.net/";
const DB ="mongodb+srv://<hazem>:<01152672868>@cluster0.zc0wqrw.mongodb.net/";

io.on("connectoin", (socket)=>{
    console.log("===== connection =====");
    //    console.log(socket.id);
    socket.on('cearteRoom', async ({nickName})=>{
         console.log(nickName);
         try{         //! room create
         let room = new Room();
         let player= {
            socketID: socket.id, 
            nickName ,
            playerType : 'X',
         };
         room.palyers.push(player);
         room.turn= player;
        room = await room.save();
     //! _id
     const roomId = room._id.toString();
      socket.join(roomId);
      io.to(roomId).emit("createRoomSuccess", room);
       }
         catch(e){
            console.log(e);
         }
    });

      socket.on("joinRoom", async ({ nickName, roomIds }) => {
        try {
          if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
            socket.emit("errorOccurred", "Please enter a valid room ID.");
            return;
          }
          let room = await Room.findById(roomId);

          if (room.isJoin) {
            let player = {
              nickName,
              socketID: socket.id,
              playerType: "O",
            };
            socket.join(roomId);
            room.players.push(player);
            room.isJoin = false;
            room = await room.save();
            io.to(roomId).emit("joinRoomSuccess", room);
            io.to(roomId).emit("updatePlayers", room.players);
            io.to(roomId).emit("updateRoom", room);
          } else {
            socket.emit(
              "errorOccurred",
              "The game is in progress, try again later."
            );
          }
        } catch (e) {
          console.log(e);
        }
      });

})

//======================//
mongoose.connect(DB).then(()=>{
    console.log(" Connected successfully ");
    
})
.catch ((e)=>{
    console.log(e);
});
server.listen(port, '0.0.0.0', () => {
  console.log(
 
`Server started and running on port ${port}`);
});


//    `Server running at http://${hostname}:${port}/`