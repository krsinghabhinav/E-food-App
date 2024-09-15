import 'package:demoteteee/message/toastmesss.dart';
import 'package:demoteteee/providers/userProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<User?> googleSignUp() async {
  UserProvider userProvider = UserProvider();
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );
    final FirebaseAuth auth = FirebaseAuth.instance;

    // // Check if the user is already signed in
    // final User? currentUser = auth.currentUser;
    // if (currentUser != null) {
    //   print("Already signed in: " + currentUser.displayName.toString());
    //   ToastUtil.showSuccess(
    //       "Already signed in: " + currentUser.displayName.toString());
    //   return currentUser;
    // }

    // If not signed in, proceed with Google sign-in
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    // if (googleUser == null) {
    //   // User canceled the sign-in
    //   ToastUtil.showSuccess("Sign-in canceled");
    //   return null;
    // }

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User? user = (await auth.signInWithCredential(credential)).user;
    print("Sign in -${user!.displayName}");
    userProvider.addUserdata(
      userName: user.displayName.toString(),
      userEmail: user.email.toString(),
      userImage: user.photoURL.toString(),
      currentUser: user,
    );
    print('userName--------${user.displayName.toString()}');
    print('userEmail--------${user.email.toString()}');
    print('userImage--------${user.photoURL.toString()}');
    print('currentUser--------${user.uid}');
    // if (user != null) {
    //   print("Signed in: " + user.displayName.toString());
    ToastUtil.showSuccess("Signed in: ${user.displayName}");
    // }
    return user;
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
      ToastUtil.showSuccess("Sign-in error: ${e.toString()} ");
    }
  }
  return null;
}
