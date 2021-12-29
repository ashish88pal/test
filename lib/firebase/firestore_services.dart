import 'package:arnowa_test/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FireStoreService {
  final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection("users");

  Future createUser(UserModel user) async {
    try {
      userCollectionRef.doc(user.id).set(user.toJson());
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      DocumentSnapshot<Object?> userData =
          await userCollectionRef.doc(uid).get();
      return UserModel.fromMap(userData.data() as Map<String, dynamic>);
    } catch (e) {
      // print(e);
    }
  }

  Future getAllUsersOnce(cr) async {
    var userDocSnap = await userCollectionRef.get();
    if (userDocSnap.docs.isNotEmpty) {
      return userDocSnap.docs
          .map((user) => UserModel.fromMap(user.data() as Map<String, dynamic>))
          .where((user) => user.id != cr)
          .toList();
    }
  }
}
