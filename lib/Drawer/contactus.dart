import 'package:contactus/contactus.dart';
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
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.purple,
          body: ContactUs(
              cardColor: Colors.white,
              textColor: Colors.purple.shade900,
              logo: const AssetImage('images/logo.jpg'),
              email: '20dit034@gmail.com',
              companyName: 'Hackathon',
              companyColor: Colors.purple.shade100,
              dividerThickness: 2,
              phoneNumber: '+917046043490',
              website: 'https://suratsitilink.org/',
              githubUserName: '4217malav',
              linkedinURL: 'https://www.linkedin.com/in/malav-patel-0851721b9',
              tagLine: 'Flutter Developer',
              taglineColor: Colors.purple.shade100,
              twitterHandle: '',
              instagram: '',
              facebookHandle: ''),
        ),
      ),
    );
  }
}
