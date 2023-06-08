import 'package:socket_io_client/socket_io_client.dart' as IO;

class Data {
// variables  ---------------------------------------------------

  static late IO.Socket socket;
  static var busRouteData = [];
  static var busDestinationData = [];
  static var connection;
  static List<String> busNumberData = [];



// functions ----------------------------------------------------
  static initializeSocket() {
    // 192.168.242.103
    Data.socket = IO.io("http://192.168.98.103:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": true,
    });
    var conne =
        Data.socket.connect(); //connect the Socket.IO Client to the Server

    print("this is connection : ${conne.connected}");
    Data.socket.onConnect((data) => {
          print("Connect ${Data.socket.id}"),
          Data.connection = conne.connected,
          print("this is connection1 : ${Data.connection}")
        });
  }

  static deconnector () {
    Data.socket.disconnect();
  }
}
