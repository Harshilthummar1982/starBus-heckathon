// const p = require('http').createServer()
const httpServer = require("http").createServer();
const socketIO = require('socket.io')(httpServer)
const mongoose = require('mongoose');
const express = require('express');
const Station = require('./schema')
const runningBus = require('./runningbus')
const app = express();
app.use(express.json())

const dbconnect = require('./dbconnect');
dbconnect();
const {
  time,
  timeStamp
} = require('console');
const {
  emit
} = require('process');
const station = require("./schema");
const { json } = require("express");
app.listen(port, () => {
  console.log(`Server started listen to the port ${port}`);
})




const getBusData = async () => {

  try {
    //  let data = dbconnection('starBus', 'station');
    //  route = (await data).find();

    // route = await data.find().toArray();
    // console.log(route)
    var data = await station.find((err, data) => {
      console.log("Call")
      if (err) {
        // return res.status(500).send(err)
        console.log("error");
      }
      else {
        // return res.send(data)
        console.log("wefds");
        console.log(data);
        socketIO.emit('sandBusStation', data);
      }
    }).clone()
    console.log("this is data", data);

  } catch (err) {
    console.log(err, 'error will be occurd');
  }
}
// const getDestination = async () => {
//   try {
//     let data = await dbconnection('BusData', 'destination');
//     destinationData = await data.find().toArray();
//     console.log("This is destination data", destinationData)
//     socketIO.emit('sendDestination', destinationData)
//   } catch (err) {
//     console.log(err, " error in the getDestination");
//   }
// }

const getBus = async (origin, Destinationa) => {
  try {
    console.log(origin, Destinationa, "sdfvgf");
    // string ori = origin;

    list1 = [origin, Destinationa]; 

    var data = await runningBus.find({ "root": { $all: [origin, Destinationa] } }, (err, data) => {
      console.log("Call")
      if (err) {
        // return res.status(500).send(err)
        console.log("error");
      }
      else {
        // return res.send(data)
        console.log(data);

        // data.forEach(element => {
        //   console.log(element["via"]);
        // });

        socketIO.emit('sandBus', data);

      }
    }).clone()

  } catch (err) {
    console.log(err, 'error will be occurd');
  }
}
const getRunningBus = async () => {
  try {

    var data = await runningBus.find((err, data) => {
      console.log("Call")
      if (err) {
        // return res.status(500).send(err)
        console.log("error");
      }
      else {
        // return res.send(data)
        console.log("wefds");
        console.log(data);
        socketIO.emit('sandRunningBus', data);
      }
    }).clone()

  } catch (err) {
    console.log(err, 'error will be occurd');
  }
}




socketIO.on('connection', async function (client) {
  console.log('Connected...', client.id);
  // getBus("Airport", "Ishwar Farm");
  // getBusData()
  client.on('disconnect', function () {
    console.log('Disconnected...', client.id);
    socketIO.emit('disconnect1', client.id);
  })

  //listens when there's an error detected and logs the error on the console
  client.on('error', function (err) {
    console.log('Error detected', client.id);
    console.log(err);
  })

  // login
  client.on('getBusStation', async function name2() {
    console.log("get is cal")
    getBusData();
    socketIO.emit('getBusStation');
  })

  client.on('getRunningBus', async function name2() {
    console.log("get is cal")
    getRunningBus();
    socketIO.emit('getRunningBus');
  })

  client.on("getBus", async function name2(data) {
    data1 = JSON.parse(data);
    console.log("get is", data1[1])
    getBus(data1[0], data1[1]);
    socketIO.emit('getBus');
  })



  // client.on('findDestination', async function name2() {
  //   console.log("get")
  //   getDestination();
  //   socketIO.emit('sendDestination');
  // })
  // client.on('getBusNumber', async function name2() {
  //   console.log("sendBusNumbert")
  //   getBusData();
  //   socketIO.emit('sendDestination');
  // })


})

var port = process.env.PORT || 3000;
//const dbconnection = require('./connection');
httpServer.listen(port, function (err) {
  if (err) console.log(err);
  console.log('Listening on port', port);
});





