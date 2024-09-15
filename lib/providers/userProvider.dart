import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
}
