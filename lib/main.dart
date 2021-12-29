import 'package:arnowa_test/Screens/home_page.dart';
import 'package:arnowa_test/Screens/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase/firebase_auth_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();
  bool isUserLoggedIn = await _firebaseAuthServices.isLoggedIn();
  // bool isUserLoggedIn = true;
  runApp(MaterialApp(
    title: 'Arnowa Text',
    home: isUserLoggedIn
        ? HomePage(
            firebaseAuthServices: _firebaseAuthServices,
          )
        : SignUpPage(),
    debugShowCheckedModeBanner: false,
  ));
}
