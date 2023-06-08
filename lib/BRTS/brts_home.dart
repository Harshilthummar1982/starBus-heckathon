// // import 'package:flutter/material.dart';

// // class BrtsHomepage extends StatelessWidget {
// //   const BrtsHomepage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const Scaffold(
// //       body: Center(
// //         child: Text("BRTS Home"),
// //       ),
// //     );
// //   }
// // }

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:starbus_hackathon/data.dart';

// class BrtsHomepage extends StatefulWidget {
//   BrtsHomepage({super.key});

//   @override
//   State<BrtsHomepage> createState() => _BrtsHomepageState();
// }

// class _BrtsHomepageState extends State<BrtsHomepage> {
// //  final scaffoldKey = GlobalKey<ScaffoldState>();
//   List<String> list = ['Select'];

//   List<String> list2 = ['Select'];

//   late String _dropdown = "Select";

//   late String _dropdown2 = "Select";

//   void getdata() async {
//     Data.socket.emit('getBusStation');
//     Data.socket.on('sandBusStation', (data) {
//       log("data is : $data");
//       //  List<String> temp = [];
//       //       // setState(() {
//       //   Data.busRouteData = data;

//       // // });
//       for (int i = 0; i < data.length; i++) {
//         list.add(data[i]['name']);
//       }
//       setState(() {
//         list = list.toSet().toList();
//         log("this is set");
//         log(list.toString());
//         // _dropdown = list.first.toString();
//         // _dropdown2 = list.last.toString();
//       });
//       //    Data.busNumberData = temp.toSet().toList();
//       // print("this is get data : ${Data.busRouteData[0]}");
//     });
//   }

//   @override
//   void initState() {
//     Data.initializeSocket();
//     getdata();
//     super.initState();
//   }
//   getbuses() {
//     Data.socket.emit("runningbuses");
//   }
//   final _unfocusNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //  key: scaffoldKey,
//       backgroundColor: Colors.white,
//       floatingActionButton: FloatingActionButton(onPressed: () {

//       }),
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         automaticallyImplyLeading: false,
//         title: const Align(
//           alignment: AlignmentDirectional(-0.05, 0),
//           child: Text(
//             'Starbus',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               color: Colors.white,
//               fontSize: 22,
//             ),
//           ),
//         ),
//         actions: const [],
//         centerTitle: false,
//         elevation: 2,
//       ),
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
//           child: Stack(
//             children: [
//               Align(
//                 alignment: const AlignmentDirectional(-0.86, -0.96),
//                 child: Material(
//                   color: Colors.transparent,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Container(
//                     width: 144,
//                     height: 55.9,
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 137, 167, 138),
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(
//                         color: Colors.grey,
//                         width: 5,
//                       ),
//                     ),
//                     child: Align(
//                       alignment: AlignmentDirectional(0, 0),
//                       child: DropdownButton<String>(
//                         value: _dropdown2,
//                         // iconSize: 28,
//                         icon: Icon(
//                           Icons.location_on_outlined,
//                           color: Colors.white,
//                           size: 28,
//                         ),
//                         // elevation: 10,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                         ),
//                         isExpanded: true,
//                         onChanged: (String? value) {
//                           // This is called when the user selects an item.
//                           setState(() {
//                             _dropdown2 = value!;
//                           });
//                         },
//                         items:
//                             list.map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: const AlignmentDirectional(0.88, -0.96),
//                 child: Material(
//                   color: Colors.transparent,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Container(
//                     width: 144.9,
//                     height: 56,
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 137, 167, 138),
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(
//                         color: Colors.grey,
//                         width: 5,
//                       ),
//                     ),
//                     child: Align(
//                       alignment: AlignmentDirectional(0, 0),
//                       child: DropdownButton<String>(
//                         value: _dropdown2,
//                         // iconSize: 28,
//                         icon: Icon(
//                           Icons.location_on_outlined,
//                           color: Colors.white,
//                           size: 28,
//                         ),
//                         // elevation: 10,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                         ),
//                         isExpanded: true,
//                         onChanged: (String? value) {
//                           // This is called when the user selects an item.
//                           setState(() {
//                             _dropdown2 = value!;
//                           });
//                         },
//                         items:
//                             list.map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const Align(
//                 alignment: AlignmentDirectional(-0.01, -0.95),
//                 child: Icon(
//                   Icons.fork_right,
//                   size: 24,
//                 ),
//               ),
//               const Align(
//                   alignment: AlignmentDirectional(-0.01, -0.89),
//                   child: Icon(
//                     Icons.fork_left,
//                     size: 24,
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:starbus_hackathon/data.dart';

class BrtsHomepage extends StatefulWidget {
  const BrtsHomepage({Key? key}) : super(key: key);

  @override
  _BrtsHomepageState createState() => _BrtsHomepageState();
}

class _BrtsHomepageState extends State<BrtsHomepage> {
// on below line we are initializing our controller for google maps.
  Completer<GoogleMapController> _controller = Completer();

// on below line we are specifying our camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(21.232409, 72.8963232),
    zoom: 14.4746,
  );

// on below line we have created list of markers
  final List<Marker> _marker = [];
  final List<Marker> _list = const [
    // List of Markers Added on Google Map
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(21.232409, 72.8963232),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),

    Marker(
        markerId: MarkerId('2'),
        position: LatLng(25.42796133580664, 80.885749655962),
        infoWindow: InfoWindow(
          title: 'Location 1',
        )),

    // Marker(
    // 	markerId: MarkerId('3'),
    // 	position: LatLng(20.42796133580664, 73.885749655962),
    // 	infoWindow: InfoWindow(
    // 	title: 'Location 2',
    // 	)
    // ),
  ];
  List<String> list = ['Select From'];
  void getdata() async {
    Data.socket.emit('getBusStation');
    Data.socket.on('sandBusStation', (data) {
      log("data is : $data");
      //  List<String> temp = [];
      //       // setState(() {
      //   Data.busRouteData = data;

      // // });
      for (int i = 0; i < data.length; i++) {
        setState(() {
          _marker.add(
            Marker(
                markerId: MarkerId('${i + 1}'),
                position: LatLng(double.parse(data[i]["lat"]),double.parse(data[i]["lon"])),
                infoWindow: InfoWindow(
                  title: data[i]["name"],
                )),
          );
        });
      }
      setState(() {
        // list = list.toSet().toList();
        // log("this is set");
        // log(list.toString());
        // _dropdown = list.first.toString();
        // _dropdown2 = list.last.toString();
      });
      //    Data.busNumberData = temp.toSet().toList();
      // print("this is get data : ${Data.busRouteData[0]}");
    });
  }
  

  @override
  void initState() {
    // TODO: implement initState
    Data.deconnector();
    Data.initializeSocket();

    // getAllBus();
    log(_marker.toString());
    log(_list[0].toString());
    setState(() {
      _marker.addAll(_list);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Container(
          // on below line creating google maps.
          child: GoogleMap(
            // on below line setting camera position
            initialCameraPosition: _kGoogle,
            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            markers: _marker.toSet(),
            // on below line setting compass enabled.
            compassEnabled: true,
            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ));
  }
}
