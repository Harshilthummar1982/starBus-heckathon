import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'package:dio/dio.dart';

class Planner extends StatefulWidget {
  String start;
  String end;
  double lat1, lat2, lon1, lon2;
  Planner(this.start, this.end, this.lat1, this.lat2, this.lon1, this.lon2);

  @override
  _PlannerState createState() =>
      _PlannerState(start, end, lat1, lat2, lon1, lon2);
}

class _PlannerState extends State<Planner> {
  String start;
  String end;
  double lat11 = 0, lat22, lon11, lon22;

  _PlannerState(
      this.start, this.end, this.lat11, this.lat22, this.lon11, this.lon22);
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyCk-QsD2kA8xhPdWOgMOwNNONrG5oOHacQ";

  Set<Marker> markers = {}; //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  late LatLng startLocation = LatLng(lat11, lon11);
  late LatLng endLocation = LatLng(lat22, lon22);

  double distance = 0.0;
  String time = "";
  double cost = 7.0;

  @override
  void initState() {
    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(startLocation.toString()),
      position: startLocation, //position of marker
      infoWindow: const InfoWindow(
        //popup info
        title: 'Starting Point ',
        snippet: 'Start Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    markers.add(Marker(
      //add distination location marker
      markerId: MarkerId(endLocation.toString()),
      position: endLocation, //position of marker
      infoWindow: const InfoWindow(
        //popup info
        title: 'Destination Point ',
        snippet: 'Destination Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    getDirections(); //fetch direction polylines from Google API

    super.initState();
  }

  var demo;
  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }

    //polulineCoordinates is the List of longitute and latidtude.
    double totalDistance = 0;
    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);
    }
    print(totalDistance);
    Dio dio = Dio();
    Response response = await dio.get(
        "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=21.204276,72.8382263&destinations=21.21868,72.7937743&key=AIzaSyCk-QsD2kA8xhPdWOgMOwNNONrG5oOHacQ");
    print("hi");
    print(response.data);
    print("hi");
    setState(() {
      distance = totalDistance;
      demo = response.data;
      cost = distance*2;
      if(cost >30){
        cost = 30;
      }
      // print("thi is s: ${demo['rows'][0]['elements'][0]['duration']['text']}");
      time = demo['rows'][0]['elements'][0]['duration']['text'].toString();
    });

    //add to the list of poly line coordinates
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.purple.shade800,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Calculate Distance Google Map"),
      //   backgroundColor: Colors.deepPurpleAccent,
      // ),
      body: Stack(
        children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation, //initial position
              zoom: 14.0, //initial zoom level
            ),
            markers: markers, //markers to show on map
            polylines: Set<Polyline>.of(polylines.values), //polylines
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
          ),

          //From
          Positioned(
            top: 40.0,
            // bottom: 40.0,
            right: 200.0,
            left: 20.0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey.withOpacity(0.2),
                      Colors.purple.shade800.withOpacity(0.29),
                    ]),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      2.0,
                      2.0,
                    ),
                    color: Colors.purple.shade800.withOpacity(0.25),
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
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  start,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          //To
          Positioned(
            top: 40.0,
            // bottom: 40.0,
            right: 20.0,
            left: 200.0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey.withOpacity(0.2),
                      Colors.purple.shade800.withOpacity(0.29),
                    ]),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      2.0,
                      2.0,
                    ),
                    color: Colors.purple.shade800.withOpacity(0.25),
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
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  end,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            // top: 40.0,
            bottom: 40.0,
            right: 80.0,
            left: 80.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey.withOpacity(0.2),
                      Colors.purple.shade800.withOpacity(0.29),
                    ]),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      2.0,
                      2.0,
                    ),
                    color: Colors.purple.shade800.withOpacity(0.25),
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
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  "${distance.toStringAsFixed(2)} km,\n Cost: ${cost.toStringAsFixed(2)} \n $time",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
