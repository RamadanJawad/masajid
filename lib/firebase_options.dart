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
    apiKey: 'AIzaSyB6A9w8ARGCWaND6RtoPFSR1pnCkV6EL84',
    appId: '1:789492870325:web:d7fbb1686c435d93c922fc',
    messagingSenderId: '789492870325',
    projectId: 'masjid-a4ec4',
    authDomain: 'masjid-a4ec4.firebaseapp.com',
    storageBucket: 'masjid-a4ec4.firebasestorage.app',
    measurementId: 'G-9TW2G22E12',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAp5fkidmqTxH0m33g_lXVHqGU4tBhBMCA',
    appId: '1:789492870325:android:56e97df4a2ec5f69c922fc',
    messagingSenderId: '789492870325',
    projectId: 'masjid-a4ec4',
    storageBucket: 'masjid-a4ec4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_xbmCp1XFjKzBZuLh_jDW7Pi3TBa0aSs',
    appId: '1:789492870325:ios:3c076ff08acc20f4c922fc',
    messagingSenderId: '789492870325',
    projectId: 'masjid-a4ec4',
    storageBucket: 'masjid-a4ec4.firebasestorage.app',
    iosBundleId: 'com.example.masajid',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_xbmCp1XFjKzBZuLh_jDW7Pi3TBa0aSs',
    appId: '1:789492870325:ios:3c076ff08acc20f4c922fc',
    messagingSenderId: '789492870325',
    projectId: 'masjid-a4ec4',
    storageBucket: 'masjid-a4ec4.firebasestorage.app',
    iosBundleId: 'com.example.masajid',
  );
}
