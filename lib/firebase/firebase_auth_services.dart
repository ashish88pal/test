import 'package:arnowa_test/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'firestore_services.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreService _fireStoreService = FireStoreService();
  late UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  Future<void> logOut() async {
    _auth.signOut();
  }

  Future<bool> isLoggedIn() async {
    var user = _auth.currentUser;
    if (user != null) {
      await _populateCurrentUser(user);
    }
    return user != null;
  }

  Future signupWithEmail(String name, String password, String email) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _currentUser =
          UserModel(id: authResult.user!.uid, email: email, name: name);
      _fireStoreService.createUser(_currentUser);
      return authResult.user != null;
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  Future loginWithEmail(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      await _populateCurrentUser(authResult.user!);
      return authResult.user != null;
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  Future _populateCurrentUser(User user) async {
    _currentUser = await _fireStoreService.getUser(user.uid);
  }
}
