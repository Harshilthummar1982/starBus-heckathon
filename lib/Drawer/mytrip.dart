import 'package:flutter/material.dart';

class MyTrip extends StatelessWidget {
  const MyTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        centerTitle: true,
        title: const Text('Mytrip'),
      ),
      body: Container(
        // ignore: prefer_const_constructors
        child: Center(
          child: const Text('My Trip Page'),
        ),
      ),
    );
  }
}