// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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

// paste api key , api id, and other info acccordingly

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'apiKey-Pw',
    appId: 'appId',
    messagingSenderId: '317804681516',
    projectId: 'projectId',
    authDomain: 'authDomain',
    storageBucket: 'storageBucket',
    measurementId: 'measurementId',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'paste',
    appId: 'paste',
    messagingSenderId: 'paste',
    projectId: 'paste',
    storageBucket: 'paste',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'paste',
    appId: 'paste',
    messagingSenderId: 'paste',
    projectId: 'paste',
    storageBucket: 'paste',
    iosBundleId: 'paste',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'paste',
    appId: 'paste',
    messagingSenderId: 'paste',
    projectId: 'paste',
    storageBucket: 'paste',
    iosBundleId: 'paste',
  );
}
