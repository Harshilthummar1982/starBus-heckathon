import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:starbus_hackathon/Sitilink/planner.dart';
import 'package:starbus_hackathon/data.dart';

final TextEditingController textControllerStart = TextEditingController();
final TextEditingController textControllerEnd = TextEditingController();

class SitilinkHomepage extends StatefulWidget {
  const SitilinkHomepage({super.key});

  @override
  State<SitilinkHomepage> createState() => _SitilinkHomepageState();
}

class _SitilinkHomepageState extends State<SitilinkHomepage> {
  var formColor = Colors.purple.shade800;
  List<String> list = ['Select'];

  List<String> list2 = ['Select'];

  late String _dropdown = "Select";

  late String _dropdown2 = "Select";

  var myData;
  int indDest = 0;
  int indOri = 0;
  getAllBus() {
    Data.socket.emit('getBus', jsonEncode([_dropdown,_dropdown2]));
    Data.socket.on('sandBus', (data) {
      log("all data is ");
      log(data.toString());
    });
  }

  void getdata() async {
    Data.socket.emit('getBusStation');
    Data.socket.on('sandBusStation', (data) {
      log("data is : $data");
      //  List<String> temp = [];
      //       // setState(() {
      //   Data.busRouteData = data;

      // // });
      for (int i = 0; i < data.length; i++) {
        list.add(data[i]['name']);
      }
      setState(() {
        list = list.toSet().toList();
        myData = data;
        log("this is set");
        log(list.toString());
        // _dropdown = list.first.toString();
        // _dropdown2 = list.last.toString();
      });
      //    Data.busNumberData = temp.toSet().toList();
      // print("this is get data : ${Data.busRouteData[0]}");
    });
  }

  @override
  void initState() {
    Data.deconnector();
    Data.initializeSocket();
    getdata();
    super.initState();
  }

  getlaiandlongoi() {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // double lat1 = 0, lat2 = 0, lon1 = 0, lon2 = 0;
          // for (var element in Data.busRouteData) {
          //   if (element['Origin Stop'] == _dropdown &&
          //       element['Destination Stop'] == _dropdown2) {
          //     lat1 = double.parse(element['lat1']);
          //     lat2 = double.parse(element['lat2']);
          //     lon1 = double.parse(element['lon1']);
          //     lon2 = double.parse(element['lon2']);
          //   }
          // }
          log(_dropdown);
          log(_dropdown2);
          log(indDest.toString());
          log(indOri.toString());
          log(myData[indOri - 1].toString());
          log(myData[indDest - 1].toString());
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Planner(
                  _dropdown,
                  _dropdown2,
                  double.parse(myData[indOri - 1]["lat"]),
                  double.parse(myData[indDest - 1]["lat"]),
                  double.parse(myData[indOri - 1]["lon"]),
                  double.parse(myData[indDest - 1]["lon"]))));
        },
        backgroundColor: Colors.black,
      ),

      body: Form(
          child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //Starting Point
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey.withOpacity(0.1),
                    Colors.purple.shade800.withOpacity(0.19),
                  ]),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(
                    2.0,
                    2.0,
                  ),
                  color: Colors.purple.shade800.withOpacity(0.2),
                  blurRadius: 5.0,
                  spreadRadius: 0.5,
                ),
                const BoxShadow(
                  offset: Offset(
                    -2.0,
                    -2.0,
                  ),
                  color: Colors.white,
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            height: 80,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton<String>(
                  value: _dropdown,
                  // iconSize: 28,
                  icon: Icon(
                    Icons.blur_circular_rounded,
                    color: formColor,
                    size: 28,
                  ),
                  // elevation: 10,
                  style: TextStyle(
                    color: formColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  isExpanded: true,

                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      _dropdown = value!;
                      indOri = list.indexOf(_dropdown);
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          //End Point
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey.withOpacity(0.1),
                    Colors.purple.shade800.withOpacity(0.19),
                  ]),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(
                    2.0,
                    2.0,
                  ),
                  color: Colors.purple.shade800.withOpacity(0.2),
                  blurRadius: 5.0,
                  spreadRadius: 0.5,
                ),
                const BoxShadow(
                  offset: Offset(
                    -2.0,
                    -2.0,
                  ),
                  color: Colors.white,
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            height: 80,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton<String>(
                  value: _dropdown2,
                  // iconSize: 28,
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: formColor,
                    size: 28,
                  ),
                  // elevation: 10,
                  style: TextStyle(
                    color: formColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  isExpanded: true,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      _dropdown2 = value!;
                      indDest = list.indexOf(_dropdown2);
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(
          //       Icons.timelapse_rounded,
          //       color: formColor,
          //     ),
          //     const SizedBox(width: 15),
          //     Text(
          //       "03:12 PM",
          //       style: TextStyle(
          //         color: formColor,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ],
          // ),
          Container(
            margin: const EdgeInsets.fromLTRB(120, 20, 120, 10),
            child: ElevatedButton(
              onPressed: () {
                // newTable(context);
                getAllBus();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(formColor),
              ),
              child: const Text(
                'Done',
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )),
      // SafeArea(
      //   child: Container(
      //     decoration: const BoxDecoration(),
      //     height: MediaQuery.of(context).size.height,
      //     width: MediaQuery.of(context).size.width,
      //     child: Stack(
      //       children: [
      //         const MapSample(),
      //         Column(
      //           children: [
      //             // BackButtonMap(),
      //             Padding(
      //               padding: const EdgeInsets.only(left: 20, top: 15),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 mainAxisSize: MainAxisSize.max,
      //                 children: [
      //                   GestureDetector(
      //                     onTap: () {
      //                       HapticFeedback.lightImpact();
      //                       Navigator.of(context).pop();
      //                     },
      //                     child: const Icon(
      //                       CupertinoIcons.left_chevron,
      //                       color: Colors.black,
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             // SearchBarMap1(),
      //             // Padding(
      //             //   padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
      //             //   child: Row(
      //             //     mainAxisAlignment: MainAxisAlignment.center,
      //             //     mainAxisSize: MainAxisSize.max,
      //             //     children: [
      //             //       Expanded(
      //             //         child: Container(
      //             //           decoration: BoxDecoration(
      //             //             borderRadius: BorderRadius.circular(10),
      //             //             boxShadow: const [
      //             //               BoxShadow(
      //             //                 color: Colors.grey,
      //             //                 offset: Offset(
      //             //                   4.0,
      //             //                   4.0,
      //             //                 ),
      //             //                 blurRadius: 5.0,
      //             //                 spreadRadius: 0.5,
      //             //               ),
      //             //               BoxShadow(
      //             //                 color: Colors.white,
      //             //                 offset: Offset(0.0, 0.0),
      //             //                 blurRadius: 0.0,
      //             //                 spreadRadius: 0.0,
      //             //               ),
      //             //             ],
      //             //           ),
      //             //           child: Center(
      //             //             child: Padding(
      //             //               padding: const EdgeInsets.all(16.0),
      //             //               child: DropdownButton<String>(
      //             //                 value: _dropdown,
      //             //                 // iconSize: 28,
      //             //                 icon: const Icon(
      //             //                   Icons.blur_circular_rounded,
      //             //                   // color: formColor,
      //             //                   color: Colors.white,
      //             //                   size: 28,
      //             //                 ),
      //             //                 // elevation: 10,
      //             //                 style: const TextStyle(
      //             //                   color: Colors.white,
      //             //                   fontSize: 18,
      //             //                   fontWeight: FontWeight.w700,
      //             //                 ),
      //             //                 isExpanded: true,

      //             //                 onChanged: (String? value) {
      //             //                   // This is called when the user selects an item.
      //             //                   setState(() {
      //             //                     _dropdown = value!;
      //             //                   });
      //             //                 },
      //             //                 items: list.map<DropdownMenuItem<String>>(
      //             //                     (String value) {
      //             //                   return DropdownMenuItem<String>(
      //             //                     value: value,
      //             //                     child: Text(value),
      //             //                   );
      //             //                 }).toList(),
      //             //               ),
      //             //             ),
      //             //           ),
      //             //           // TextFormField(
      //             //           //   controller: textControllerStart,
      //             //           //   obscureText: false,
      //             //           //   cursorColor: Colors.black,
      //             //           //   decoration: InputDecoration(
      //             //           //     hintText: 'From Where you want to start?',
      //             //           //     contentPadding: const EdgeInsets.only(left: 0),
      //             //           //     hintStyle: GoogleFonts.poppins(
      //             //           //       textStyle: Theme.of(context).textTheme.displayMedium,
      //             //           //       fontWeight: FontWeight.w500,
      //             //           //       fontSize: 14,
      //             //           //       color: Colors.black,
      //             //           //     ),
      //             //           //     enabledBorder: OutlineInputBorder(
      //             //           //       borderSide: const BorderSide(
      //             //           //         color: Colors.white,
      //             //           //       ),
      //             //           //       borderRadius: BorderRadius.circular(10),
      //             //           //     ),
      //             //           //     focusedBorder: OutlineInputBorder(
      //             //           //       borderSide: const BorderSide(
      //             //           //         color: Colors.white,
      //             //           //       ),
      //             //           //       borderRadius: BorderRadius.circular(10),
      //             //           //     ),
      //             //           //     prefixIcon: const Padding(
      //             //           //       padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
      //             //           //       child: Icon(
      //             //           //         Icons.search_sharp,
      //             //           //         color: Colors.black,
      //             //           //       ),
      //             //           //     ),
      //             //           //   ),
      //             //           // ),
      //             //         ),
      //             //       ),
      //             //     ],
      //             //   ),
      //             // ),
      //             Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(15),
      //                 gradient: LinearGradient(
      //                     begin: Alignment.topLeft,
      //                     end: Alignment.bottomRight,
      //                     colors: [
      //                       Colors.grey.withOpacity(0.1),
      //                       Colors.purple.shade800.withOpacity(0.19),
      //                     ]),
      //                 boxShadow: [
      //                   BoxShadow(
      //                     offset: const Offset(
      //                       2.0,
      //                       2.0,
      //                     ),
      //                     color: Colors.purple.shade800.withOpacity(0.2),
      //                     blurRadius: 5.0,
      //                     spreadRadius: 0.5,
      //                   ),
      //                   const BoxShadow(
      //                     offset: Offset(
      //                       -2.0,
      //                       -2.0,
      //                     ),
      //                     color: Colors.white,
      //                     blurRadius: 0.0,
      //                     spreadRadius: 0.0,
      //                   ),
      //                 ],
      //               ),
      //               height: 80,
      //               child: Center(
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(16.0),
      //                   child: DropdownButton<String>(
      //                     value: _dropdown,
      //                     // iconSize: 28,
      //                     icon: Icon(
      //                       Icons.blur_circular_rounded,
      //                       color: Colors.white,
      //                       size: 28,
      //                     ),
      //                     // elevation: 10,
      //                     style: TextStyle(
      //                       color: Colors.black,
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.w700,
      //                     ),
      //                     isExpanded: true,

      //                     onChanged: (String? value) {
      //                       // This is called when the user selects an item.
      //                       setState(() {
      //                         _dropdown = value!;
      //                       });
      //                     },
      //                     items: list
      //                         .map<DropdownMenuItem<String>>((String value) {
      //                       return DropdownMenuItem<String>(
      //                         value: value,
      //                         child: Text(value),
      //                       );
      //                     }).toList(),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             // SearchBarMap2(),
      //             // Padding(
      //             //   padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
      //             //   child: Row(
      //             //     mainAxisAlignment: MainAxisAlignment.center,
      //             //     mainAxisSize: MainAxisSize.max,
      //             //     children: [
      //             //       Expanded(
      //             //         child: Container(
      //             //           decoration: BoxDecoration(
      //             //             borderRadius: BorderRadius.circular(10),
      //             //             boxShadow: const [
      //             //               BoxShadow(
      //             //                 color: Colors.grey,
      //             //                 offset: Offset(
      //             //                   4.0,
      //             //                   4.0,
      //             //                 ),
      //             //                 blurRadius: 5.0,
      //             //                 spreadRadius: 0.5,
      //             //               ),
      //             //               BoxShadow(
      //             //                 color: Colors.white,
      //             //                 offset: Offset(0.0, 0.0),
      //             //                 blurRadius: 0.0,
      //             //                 spreadRadius: 0.0,
      //             //               ),
      //             //             ],
      //             //           ),
      //             //           child: Center(
      //             //             child: Padding(
      //             //               padding: const EdgeInsets.all(16.0),
      //             //               child: DropdownButton<String>(
      //             //                 value: _dropdown2,
      //             //                 // iconSize: 28,
      //             //                 icon: const Icon(
      //             //                   Icons.location_on_outlined,
      //             //                   // color: formColor,
      //             //                   color: Colors.white,
      //             //                   size: 28,
      //             //                 ),
      //             //                 // elevation: 10,
      //             //                 style: const TextStyle(
      //             //                   // color: formColor,
      //             //                   color: Colors.white,
      //             //                   fontSize: 18,
      //             //                   fontWeight: FontWeight.w700,
      //             //                 ),
      //             //                 isExpanded: true,
      //             //                 onChanged: (String? value) {
      //             //                   // This is called when the user selects an item.
      //             //                   setState(() {
      //             //                     _dropdown2 = value!;
      //             //                   });
      //             //                 },
      //             //                 items: list.map<DropdownMenuItem<String>>(
      //             //                     (String value) {
      //             //                   return DropdownMenuItem<String>(
      //             //                     value: value,
      //             //                     child: Text(value),
      //             //                   );
      //             //                 }).toList(),
      //             //               ),
      //             //             ),
      //             //           ),
      //             //           // TextFormField(
      //             //           //   controller: textControllerEnd,
      //             //           //   obscureText: false,
      //             //           //   cursorColor: Colors.black,
      //             //           //   decoration: InputDecoration(
      //             //           //     hintText: 'Where are you going to?',
      //             //           //     contentPadding: const EdgeInsets.only(left: 0),
      //             //           //     hintStyle: GoogleFonts.poppins(
      //             //           //       textStyle:
      //             //           //           Theme.of(context).textTheme.displayMedium,
      //             //           //       fontWeight: FontWeight.w500,
      //             //           //       fontSize: 14,
      //             //           //       color: Colors.black,
      //             //           //     ),
      //             //           //     enabledBorder: OutlineInputBorder(
      //             //           //       borderSide: const BorderSide(
      //             //           //         color: Colors.white,
      //             //           //       ),
      //             //           //       borderRadius: BorderRadius.circular(10),
      //             //           //     ),
      //             //           //     focusedBorder: OutlineInputBorder(
      //             //           //       borderSide: const BorderSide(
      //             //           //         color: Colors.white,
      //             //           //       ),
      //             //           //       borderRadius: BorderRadius.circular(10),
      //             //           //     ),
      //             //           //     prefixIcon: const Padding(
      //             //           //       padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
      //             //           //       child: Icon(
      //             //           //         Icons.search_sharp,
      //             //           //         color: Colors.black,
      //             //           //       ),
      //             //           //     ),
      //             //           //   ),
      //             //           // ),
      //             //         ),
      //             //       ),
      //             //     ],
      //             //   ),
      //             // ),
      //             Container(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(15),
      //         gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             colors: [
      //               Colors.grey.withOpacity(0.1),
      //               Colors.purple.shade800.withOpacity(0.19),
      //             ]),
      //         boxShadow: [
      //           BoxShadow(
      //             offset: const Offset(
      //               2.0,
      //               2.0,
      //             ),
      //             color: Colors.purple.shade800.withOpacity(0.2),
      //             blurRadius: 5.0,
      //             spreadRadius: 0.5,
      //           ),
      //           const BoxShadow(
      //             offset: Offset(
      //               -2.0,
      //               -2.0,
      //             ),
      //             color: Colors.white,
      //             blurRadius: 0.0,
      //             spreadRadius: 0.0,
      //           ),
      //         ],
      //       ),
      //       height: 80,
      //       child: Center(
      //         child: Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child: DropdownButton<String>(
      //             value: _dropdown2,
      //             // iconSize: 28,
      //             icon: Icon(
      //               Icons.location_on_outlined,
      //               color: Colors.white,
      //               size: 28,
      //             ),
      //             // elevation: 10,
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 18,
      //               fontWeight: FontWeight.w700,
      //             ),
      //             isExpanded: true,
      //             onChanged: (String? value) {
      //               // This is called when the user selects an item.
      //               setState(() {
      //                 _dropdown2 = value!;
      //               });
      //             },
      //             items: list.map<DropdownMenuItem<String>>((String value) {
      //               return DropdownMenuItem<String>(
      //                 value: value,
      //                 child: Text(value),
      //               );
      //             }).toList(),
      //           ),
      //         ),
      //       ),
      //     ),
      //             GestureDetector(
      //               onTap: () {
      //                 log("drop");
      //                 log(_dropdown);
      //                 log(_dropdown2);

      //               },
      //               child: Container(
      //                 color: Colors.amber,
      //                 height: 40,
      //                 width: 60,
      //                 child: Center(child: Text("Drection")),
      //               ),
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

// class SearchBarMap1 extends StatelessWidget {
//   const SearchBarMap1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

// class SearchBarMap2 extends StatelessWidget {
//   const SearchBarMap2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

// class BackButtonMap extends StatelessWidget {
//   const BackButtonMap({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

//Map
class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 1.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(23.0695746, 72.5323023),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: true,
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          controller.animateCamera(
            CameraUpdate.newCameraPosition(_kLake),
          );
        },
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
