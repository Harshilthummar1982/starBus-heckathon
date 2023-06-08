import 'package:flutter/material.dart';

class GsrtcHomepage extends StatelessWidget {
  const GsrtcHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GSRTC"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 0.05)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan.shade200,
                            // border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("  ${bustype[index]}"),
                              Text("Station No. : ${stationnumber[index]}"),
                              Text("INR ${rs[index]}  "),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.05),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${from[index]} - ${to[index]}")
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(arrivaltime[index]),
                                      const Text("         "),
                                      Text(
                                        totalhours[index],
                                        style:
                                            const TextStyle(color: Colors.red),
                                      ),
                                      const Text("         "),
                                      Text(departuretime[index]),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Text("Tripcode : "),
                                      Text(
                                        tripcode[index],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Text("Via Places : "),
                                      Text(viaplaces[index]),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

final List<String> bustype = [
  'SITTING',
  'VOLVO',
  'SITTING',
  'VOLVO',
  'SLEEPER',
  'SITTING',
  'VOLVO',
  'SLEEPER',
  'SITTING',
  'SITTING',
  'SLEEPER',
  'SITTING',
];
final List<String> stationnumber = [
  '5',
  '2',
  '4',
  '9',
  '1',
  '3',
  '6',
  '8',
  '9',
  '10',
  '12',
  '11',
];

final List<String> rs = [
  '802',
  '135',
  '326',
  '707',
  '212',
  '802',
  '135',
  '326',
  '707',
  '212',
  '802',
  '135',
];
final List<String> from = [
  'ANKLESHWAR',
  'BHARUCH',
  'MAHESANA CENTRAL ',
  'BANDHNI CHOKDI',
  'PALANPUR',
  'SURAT CENTRAL BUS STAND',
  'NADIAD',
  'ANAND',
  'MUMBAI CENTRAL',
  'UNZA BUS DEPORT',
  'RAJKOT',
  'AMRELI',
];
final List<String> to = [
  'NADIAD',
  'AMRELI',
  'SURAT CENTRAL ',
  'AMRELI',
  'NADIAD',
  'AMRELI',
  'AMRELI',
  'PALANPUR',
  'BANDHNI CHOKDI',
  'MAHESANA CENTRAL BUS STAND',
  'BHARUCH',
  'ANKLESHWAR',
];
final List<String> arrivaltime = [
  '05:15:00',
  '05:20:00',
  '05:25:00',
  '05:45:00',
  '05:30:00',
  '05:30:00',
  '05:55:00',
  '06:10:00',
  '06:15:00',
  '06:20:00',
  '06:25:00',
  '06:45:00',
  '07:00:00',
];
final List<String> departuretime = [
  '05:30:00',
  '05:40:00',
  '05:45:00',
  '05:50:00',
  '05:35:00',
  '05:40:00',
  '06:00:00',
  '06:15:00',
  '06:20:00',
  '06:30:00',
  '06:45:00',
  '06:00:00',
  '07:05:00',
];
final List<String> totalhours = [
  '02:46 hrs',
  '03:27 hrs',
  '08:09 hrs',
  '07:15 hrs',
  '10:36 hrs',
  '06:14 hrs',
  '09:52 hrs',
  '01:37 hrs',
  '04:11 hrs',
  '07:59 hrs',
  '06:25 hrs',
  '12:46 hrs',
];
final List<String> tripcode = [
  '0005SRTSNDRSRP30',
  '7ADKSCNALE324352',
  '13CAS54CA2SF84CA',
  'A6D45A5EC32A1EC5',
  'A32C1A6F85A1CAE5',
  'SD32121FEW5AC53C',
  '8ARE4V13A2R3SDVS',
  'WE6541VE5RVS3THW',
  '6A9V61BA3C5E8SFC',
  '9AG4AC1AS3F4SC9S',
  '8AC1A321XSG84ASF',
  '1A486AVA43SE2FAC',
  '34EFAERYSG3W5E6T',
];
final List<String> viaplaces = [
  'SRT,HDK,CUD,CHA,ACD',
  'KAC,ACEI,DICS,NFS,CJ',
  'AKD,CASDF,CAE,SRT,SEC',
  'ASFC,AHM,SADV,ACAE,AC',
  'ASDC,AC,NIC,LKA,MCO,ES',
  'KAC,ACEI,DICS,NFS,CJ',
  'AKD,CASDF,CAE,SRT,SEC',
  'ASFC,AHM,SADV,ACAE,AC',
  'ASFC,AHM,SADV,ACAE,AC',
  'KAC,ACEI,DICS,NFS,CJ',
  'SRT,HDK,CUD,CHA,ACD',
  'ASDC,AC,NIC,LKA,MCO,ES',
];
