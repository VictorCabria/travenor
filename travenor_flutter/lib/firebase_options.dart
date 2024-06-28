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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAH7ntUHjRnlcmbGTTN_nGQaZJi7C8MB80',
    appId: '1:151460782658:web:e354868c5e0519aee403db',
    messagingSenderId: '151460782658',
    projectId: 'testeosproyectos',
    authDomain: 'testeosproyectos.firebaseapp.com',
    storageBucket: 'testeosproyectos.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlcfIQXZf5F-NBC8-F3NAwSEL4UEMOuDk',
    appId: '1:151460782658:android:8d3ff14fd00d6efae403db',
    messagingSenderId: '151460782658',
    projectId: 'testeosproyectos',
    storageBucket: 'testeosproyectos.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmvrwFIIn3r9X01ltMZ7zEtbrteBSJGpk',
    appId: '1:151460782658:ios:ff791cf6b2253a61e403db',
    messagingSenderId: '151460782658',
    projectId: 'testeosproyectos',
    storageBucket: 'testeosproyectos.appspot.com',
    iosBundleId: 'com.travelappflutter.app',
  );
}
