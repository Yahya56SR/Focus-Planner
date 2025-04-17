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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOQ6DkjhMbmeyVZ0guT-p7Usj9fA0HF8o',
    appId: '1:217096367032:android:00e7090b0a9974f2fb7d4d',
    messagingSenderId: '217096367032',
    projectId: 'focus-planer',
    databaseURL: 'https://focus-planer-default-rtdb.firebaseio.com',
    storageBucket: 'focus-planer.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhTWOi5zqwcbP91-DO2VeKDTBWaPfR4S8',
    appId: '1:217096367032:ios:39338c6112351fa4fb7d4d',
    messagingSenderId: '217096367032',
    projectId: 'focus-planer',
    databaseURL: 'https://focus-planer-default-rtdb.firebaseio.com',
    storageBucket: 'focus-planer.firebasestorage.app',
    iosClientId: '217096367032-acr5q4aalqdf924kgjtjg9olujjbm7c1.apps.googleusercontent.com',
    iosBundleId: 'com.nexordev.focusplanner',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBDjH3tPd179HkORDEERPaK-59xSKyp470',
    appId: '1:217096367032:web:d8f32d07aa3b19affb7d4d',
    messagingSenderId: '217096367032',
    projectId: 'focus-planer',
    authDomain: 'focus-planer.firebaseapp.com',
    databaseURL: 'https://focus-planer-default-rtdb.firebaseio.com',
    storageBucket: 'focus-planer.firebasestorage.app',
    measurementId: 'G-EFXG06C121',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhTWOi5zqwcbP91-DO2VeKDTBWaPfR4S8',
    appId: '1:217096367032:ios:39338c6112351fa4fb7d4d',
    messagingSenderId: '217096367032',
    projectId: 'focus-planer',
    databaseURL: 'https://focus-planer-default-rtdb.firebaseio.com',
    storageBucket: 'focus-planer.firebasestorage.app',
    iosClientId: '217096367032-acr5q4aalqdf924kgjtjg9olujjbm7c1.apps.googleusercontent.com',
    iosBundleId: 'com.nexordev.focusplanner',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBDjH3tPd179HkORDEERPaK-59xSKyp470',
    appId: '1:217096367032:web:7a011c27c3cfb6cbfb7d4d',
    messagingSenderId: '217096367032',
    projectId: 'focus-planer',
    authDomain: 'focus-planer.firebaseapp.com',
    databaseURL: 'https://focus-planer-default-rtdb.firebaseio.com',
    storageBucket: 'focus-planer.firebasestorage.app',
    measurementId: 'G-N4XWHQH29P',
  );

}