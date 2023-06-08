import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        centerTitle: true,
        title: const Text('Contact Us'),
      ),
      body: Container(
        // ignore: prefer_const_constructors
        child: Center(
          child: const Text('Contact US Page'),
        ),
      ),
    );
  }
}