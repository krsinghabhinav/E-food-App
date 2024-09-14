// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDORl6_O8xZJaiDeOqU1MshTVtrAL_dkp0',
    appId: '1:520886547015:web:45aa23d980277078283762',
    messagingSenderId: '520886547015',
    projectId: 'fire-3fb9b',
    authDomain: 'fire-3fb9b.firebaseapp.com',
    storageBucket: 'fire-3fb9b.appspot.com',
    measurementId: 'G-2EW7Q2G56B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsoKx4S5eOWa7Yv4VWvuATVe6b5AtnKqI',
    appId: '1:520886547015:android:415efb0bfb1949c7283762',
    messagingSenderId: '520886547015',
    projectId: 'fire-3fb9b',
    storageBucket: 'fire-3fb9b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqIM20qXiFX_hxKzzisCSWq0VV-Bw3cnY',
    appId: '1:520886547015:ios:d301a8a15db5320d283762',
    messagingSenderId: '520886547015',
    projectId: 'fire-3fb9b',
    storageBucket: 'fire-3fb9b.appspot.com',
    iosBundleId: 'com.example.demoteteee',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqIM20qXiFX_hxKzzisCSWq0VV-Bw3cnY',
    appId: '1:520886547015:ios:d301a8a15db5320d283762',
    messagingSenderId: '520886547015',
    projectId: 'fire-3fb9b',
    storageBucket: 'fire-3fb9b.appspot.com',
    iosBundleId: 'com.example.demoteteee',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDORl6_O8xZJaiDeOqU1MshTVtrAL_dkp0',
    appId: '1:520886547015:web:e1e02f02d7518410283762',
    messagingSenderId: '520886547015',
    projectId: 'fire-3fb9b',
    authDomain: 'fire-3fb9b.firebaseapp.com',
    storageBucket: 'fire-3fb9b.appspot.com',
    measurementId: 'G-M4SKZ3MV3B',
  );
}
