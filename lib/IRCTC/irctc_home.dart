import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:starbus_hackathon/data.dart';

class IrctcHomepage extends StatefulWidget {
  const IrctcHomepage({super.key});

  @override
  State<IrctcHomepage> createState() => _IrctcHomepageState();
}

class _IrctcHomepageState extends State<IrctcHomepage> {
  @override
  void initState() {
    // TODO: implement initState
    
    getdata();
    super.initState();
  }

  void getdata() async {
    log("get call");
    Data.socket.emit('getBus');
    log("fdfgd");
    Data.socket.on('sandBus', (data) {
      log("erfds");
      log(data.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("IRCTC Home"),
      ),
    );
  }
}
