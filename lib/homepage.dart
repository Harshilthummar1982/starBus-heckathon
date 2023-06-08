import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:starbus_hackathon/Airport/airport_home.dart';
import 'package:starbus_hackathon/BRTS/brts_home.dart';
import 'package:starbus_hackathon/GSRTC/gsrtc_home.dart';
import 'package:starbus_hackathon/IRCTC/irctc_home.dart';
import 'package:starbus_hackathon/Sitilink/sitilink.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const MyNevBar();
  }
}

class MyNevBar extends StatefulWidget {
  const MyNevBar({super.key});

  @override
  _MyNevBarState createState() => _MyNevBarState();
}

class _MyNevBarState extends State<MyNevBar> {
  int currentIndex = 0;
   late IO.Socket socket;

  List listOfPages = [
    const GsrtcHomepage(),
    const SitilinkHomepage(),
    BrtsHomepage(),
    const IrctcHomepage(),
    const AirportHome(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    Data.initializeSocket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     'StarBus',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   backgroundColor: Colors.black,
      // ),
      body: listOfPages[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
            //   _pageController.animateToPage(index,
            //       duration: Duration(milliseconds: 300), curve: Curves.ease);
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.directions_bus_outlined),
            title: const Text('GSRTC'),
            activeColor: Colors.black,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.map_outlined),
            title: const Text('Sitilink'),
            activeColor: Colors.black,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.gps_fixed),
            title: const Text('BRTS'),
            activeColor: Colors.black,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.train_outlined),
            title: const Text('IRCTC'),
            activeColor: Colors.black,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.flight_takeoff),
            title: const Text('Flights'),
            activeColor: Colors.black,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
