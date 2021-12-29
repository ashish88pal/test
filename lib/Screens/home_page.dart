import 'package:arnowa_test/firebase/firebase_auth_services.dart';
import 'package:flutter/material.dart';

import 'clock/clock.dart';
import 'clock/digital_clock.dart';
import 'signup_page.dart';

class HomePage extends StatefulWidget {
  final FirebaseAuthServices firebaseAuthServices;
  const HomePage({Key? key, required this.firebaseAuthServices})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Welcome  ${widget.firebaseAuthServices.currentUser.name} ! 😃",
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
                widget.firebaseAuthServices.logOut();
              })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffffffff), Color(0xffF7E8EF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, .8])),
        child: Center(
          // child: Text(DateTime.now().toString()),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  Clock(),
                  SizedBox(
                    height: 20,
                  ),
                  DigiClock(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
