import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoteteee/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Future<void> addUserdata({
    User? currentUser,
    String userName = '',
    String userEmail = '',
    String userImage = '',
  }) async {
    await FirebaseFirestore.instance
        .collection("UsersData")
        .doc(currentUser?.uid)
        .set({
      'userName': userName,
      'userEmail': userEmail,
      'userImage': userImage,
      'userUid': currentUser!.uid,
    });
    notifyListeners();
  }

  late UserModel currentData;
  Future<void> getUserData() async {
    UserModel userModel;
    var uservalue = await FirebaseFirestore.instance
        .collection("UsersData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (uservalue.exists) {
      userModel = UserModel(
        userName: uservalue.get("userName"),
        userEmail: uservalue.get("userEmail"),
        userImage: uservalue.get("userImage"),
        userUid: uservalue.get("userUid"),
      );
    }
  }
}
