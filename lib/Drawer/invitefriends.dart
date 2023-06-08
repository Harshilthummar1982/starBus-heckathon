import 'package:flutter/material.dart';

class IntiveFriends extends StatelessWidget {
  const IntiveFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        centerTitle: true,
        title: const Text('Invite Friend'),
      ),
      body: Container(
        // ignore: prefer_const_constructors
        child: Center(
          child: const Text('Invite Friend Page'),
        ),
      ),
    );
  }
}