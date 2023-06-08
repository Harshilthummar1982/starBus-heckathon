import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AirportHome extends StatelessWidget {
  const AirportHome({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMEEEEd().format(DateTime.now());
    String formattedtime = DateFormat.jms().format(DateTime.now());
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                height: 90,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Surat International Airport",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Surat, Gujarat, India",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          formattedDate,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                        Text(
                          formattedtime,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 690,
                child: ListView.builder(
                  itemCount: time.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.black12),
                        height: 100,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.watch_later_outlined),
                                    Text(" ${time[index]}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.flight_takeoff),
                                    Text(" ${city[index]}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.list),
                                    Text(" ${flightno[index]}"),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.flight),
                                    Text(" ${flightno[index]}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.message),
                                    Text(" ${delayed[index]}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.directions_walk_outlined),
                                    Text("Terminal: ${terminal[index]}"),
                                    Text(" Gate: ${gate[index]}"),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> time = [
  '11:45 AM',
  '12:00 AM',
  '12:05 AM',
  '12:15 AM',
  '12:30 AM',
];
final List<String> city = [
  'Delhi',
  'Singapore',
  'Kolkata',
  'Bangluru',
  'Mumbai',
];
final List<String> flightno = [
  'VJC 802',
  'PG 135',
  'QH 326',
  'SQ 707',
  'BR 212',
];
final List<String> delayed = [
  'Delayed 18 min',
  'Scheduled',
  'Scheduled',
  'Scheduled',
  'Earlier 5 min',
];
final List<String> terminal = [
  '1',
  '7',
  '10',
  '8',
  '3',
];
final List<String> gate = [
  '5',
  '2',
  '4',
  '9',
  '11',
];