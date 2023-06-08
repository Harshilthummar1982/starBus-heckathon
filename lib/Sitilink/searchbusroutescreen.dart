import 'package:flutter/material.dart';

class SearchBusRoute extends StatefulWidget {
  const SearchBusRoute({super.key});

  @override
  State<SearchBusRoute> createState() => _SearchBusRouteState();
}

class _SearchBusRouteState extends State<SearchBusRoute> {
  // var formColor = Colors.purple.shade800;
  var formColor = Colors.black;

  // late IO.Socket socket;

  TextEditingController editingController = TextEditingController();
  var items = <dynamic>[];
  var finalBusSearch = <dynamic>[];

  void filterSearchResults(String query) async {
    List<dynamic> dummySearchList = <dynamic>[];
    List<dynamic> tempBusSearch = <dynamic>[];
    // dummySearchList.addAll(Data.busNumberData);
    // tempBusSearch.addAll(Data.busRouteData);
    // print('this is dumm : ${Data.busNumberData}');
    print("this is final obj : $finalBusSearch");
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      for (int i = 0; i < dummySearchList.length; i++) {
        if (dummySearchList[i].contains(query)) {
          // tempBusSearch.add(Data.busRouteData[i]);
          dummyListData.add(dummySearchList[i]);
          // print("this is for $i : ${tempBusSearch}");
        }
      }

      // for (var item in dummySearchList) {
      //   if (item.contains(query)) {
      //     dummyListData.add(item);
      //   }
      // }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
        finalBusSearch.clear();
        finalBusSearch.addAll(tempBusSearch);
      });
      return;
    } else {
      setState(() {
        items.clear();
        // items.addAll(Data.busDestinationData);
        finalBusSearch.clear();
        // finalBusSearch.addAll(Data.busRouteData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: formColor,
        title: const Text('Search Bus Route Number'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: TextFormField(
              onChanged: (value) {
                filterSearchResults(value.toUpperCase());
              },
              controller: editingController,
              cursorColor: formColor,
              decoration: InputDecoration(
                labelText: "Enter Bus Number",
                labelStyle: TextStyle(
                  color: formColor,
                  fontWeight: FontWeight.w600,
                ),
                hintText: "SearchBusRoute",
                hintStyle: TextStyle(color: formColor),
                iconColor: formColor,
                focusColor: formColor,
                hoverColor: formColor,
                fillColor: formColor,
                border: const OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.hdr_weak_sharp,
                  color: formColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: formColor.withOpacity(0.4),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: formColor.withOpacity(0.4),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          //
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.train),
                  title: Text('${items[index]}'),
                  subtitle: Text(
                      "${finalBusSearch[index]['Origin Stop']} to ${finalBusSearch[index]['Destination Stop']}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
//     Scaffold(
//       appBar: new AppBar(
//         title: new Text("fd"),
//       ),

//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 onChanged: (value) {
//                   filterSearchResults(value.toUpperCase());
//                 },
//                 controller: editingController,
//                 decoration: const InputDecoration(
//                     labelText: "Search",
//                     hintText: "Search",
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//               ),
//             ),
            // Expanded(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: items.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text('${items[index]}'),
            //       );
            //     },
            //   ),
            // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  
// import 'package:app/Database/data.dart';
// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class SearchBusRoute extends StatefulWidget {
//   const SearchBusRoute({super.key});

//   @override
//   State<SearchBusRoute> createState() => _SearchBusRouteState();
// }

// class _SearchBusRouteState extends State<SearchBusRoute> {
//   var formColor = Colors.purple.shade800;
//   final TextEditingController _tableNumber = TextEditingController();
//   final TextEditingController _tableCapacity = TextEditingController();
//   late IO.Socket socket;
//   var connection;

//   TextEditingController editingController = TextEditingController();
//   var items = <dynamic>[];

//   @override
//   void initState() {
//     Data.initializeSocket();
//     getdata();
//     getBusDestination();
//     super.initState();
//   }

//   void getBusDestination() {
//     Data.socket.emit('findDestination');
//     Data.socket.on('sendDestination', (data) {
//       setState(() {
//         Data.busDestinationData = data[0]['Stops'];
//       });
//       print('this is busfcf: ${Data.busDestinationData}');
//     });
//   }

//   void getdata() async {
//     Data.socket.emit('getBusRouteData');
//     Data.socket.on('sendBusRouteData', (data) => Data.busRouteData);
//   }

//   void filterSearchResults(String query) async {
//     List<dynamic> dummySearchList = <dynamic>[];
//     if (Data.busDestinationData != null) {
//       dummySearchList.addAll(Data.busDestinationData);
//     }
//     print('this is dumm : $dummySearchList');
//     if (query.isNotEmpty) {
//       List<String> dummyListData = <String>[];
//       dummySearchList.forEach((item) async {
//         if (item.contains(query)) {
//           dummyListData.add(item);
//         }
//       });
//       setState(() {
//         items.clear();
//         items.addAll(dummyListData);
//       });
//       return;
//     } else {
//       setState(() {
//         items.clear();
//         items.addAll(Data.busDestinationData);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: formColor,
//         title: const Text('Search your Bus'),
//         centerTitle: true,
//       ),
//       body: Form(
//           child: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
//                   child: TextFormField(
//                     onChanged: ((value) {
//                       filterSearchResults(value.toUpperCase());
//                     }),
//                     controller: _tableNumber,
//                     cursorColor: formColor,
//                     decoration: InputDecoration(
//                       labelText: "Enter Start Stop",
//                       labelStyle: TextStyle(
//                         color: formColor,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       hintText: "Eg. Varachha",
//                       hintStyle: TextStyle(color: formColor),
//                       iconColor: formColor,
//                       focusColor: formColor,
//                       hoverColor: formColor,
//                       fillColor: formColor,
//                       border: const OutlineInputBorder(),
//                       suffixIcon: Icon(
//                         Icons.hdr_weak_sharp,
//                         color: formColor,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: formColor.withOpacity(0.4),
//                           width: 2,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: formColor.withOpacity(0.4),
//                           width: 2,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: (items.length != 0)
//                       ? ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: items.length,
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               title: Text('${items[index]}'),
//                             );
//                           },
//                         )
//                       : Container(),
//                 ),
//               ],
//             ),
//           ),

//           // validator: (String? value) {
//           //   if (value == null || value.isEmpty) {
//           //     return 'Please enter some text';
//           //   }
//           //   return null;
//           // },

//           // formFild(context, _tableCapacity, "Enter End Stop",
//           //     "Eg. Sarthana Nature Park", formColor),

//           Container(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
//                   child: TextFormField(
//                     onChanged: ((value) {
//                       filterSearchResults(value.toUpperCase());
//                     }),
//                     controller: _tableCapacity,
//                     cursorColor: formColor,
//                     decoration: InputDecoration(
//                       labelText: "Enter End Stop",
//                       labelStyle: TextStyle(
//                         color: formColor,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       hintText: "Eg. Sarthana Nature Park",
//                       hintStyle: TextStyle(color: formColor),
//                       iconColor: formColor,
//                       focusColor: formColor,
//                       hoverColor: formColor,
//                       fillColor: formColor,
//                       border: const OutlineInputBorder(),
//                       suffixIcon: Icon(
//                         Icons.hdr_weak_sharp,
//                         color: formColor,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: formColor.withOpacity(0.4),
//                           width: 2,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: formColor.withOpacity(0.4),
//                           width: 2,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: (items.length != 0)
//                       ? ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: items.length,
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               title: Text('${items[index]}'),
//                             );
//                           },
//                         )
//                       : Container(),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: (items.length != 0)
//                 ? ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: items.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text('${items[index]}'),
//                       );
//                     },
//                   )
//                 : Container(),
//           ),

//           // validator: (String? value) {
//           //   if (value == null || value.isEmpty) {
//           //     return 'Please enter some text';
//           //   }
//           //   return null;
//           // },

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [ 
//               Icon(
//                 Icons.timelapse_rounded,
//                 color: formColor,
//               ),
//               const SizedBox(width: 15),
//               Text(
//                 "03:12 PM",
//                 style: TextStyle(
//                   color: formColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),

//           Container(
//             margin: const EdgeInsets.fromLTRB(120, 10, 120, 10),
//             child: ElevatedButton(
//               onPressed: () {
//                 // newTable(context);
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(formColor),
//               ),
//               child: const Text(
//                 'Create',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }
// //     Scaffold(
// //       appBar: new AppBar(
// //         title: new Text("fd"),
// //       ),

// //       body: Container(
// //         child: Column(
// //           children: <Widget>[
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: TextField(
// //                 onChanged: (value) {
// //                   filterSearchResults(value.toUpperCase());
// //                 },
// //                 controller: editingController,
// //                 decoration: const InputDecoration(
// //                     labelText: "Search",
// //                     hintText: "Search",
// //                     prefixIcon: Icon(Icons.search),
// //                     border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.all(Radius.circular(25.0)))),
// //               ),
// //             ),
//             // Expanded(
//             //   child: ListView.builder(
//             //     shrinkWrap: true,
//             //     itemCount: items.length,
//             //     itemBuilder: (context, index) {
//             //       return ListTile(
//             //         title: Text('${items[index]}'),
//             //       );
//             //     },
//             //   ),
//             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

  