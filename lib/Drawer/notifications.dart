import 'dart:math';

import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        centerTitle: true,
        title: const Text('Notification'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 2),
            Container(
              margin: const EdgeInsets.all(4),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 143, 94, 206),
              ),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: const [
                  Center(
                    child: Text(
                      'BRTS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Text(
                    "Good Morning!! LEt Begin Our Journey",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
