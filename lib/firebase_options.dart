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
    apiKey: 'AIzaSyBZMy_xqnLeRjK6H_5tPi_AvhEsGz09fY4',
    appId: '1:375486720938:web:360f12fef3c0daaf8959d3',
    messagingSenderId: '375486720938',
    projectId: 'food-hood',
    authDomain: 'food-hood.firebaseapp.com',
    storageBucket: 'food-hood.appspot.com',
    measurementId: 'G-V7JCLY7Z4Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBT3u4baeBDPTpzUrquaoGXbeNQkADsp74',
    appId: '1:375486720938:android:043cafb6a81ffcc98959d3',
    messagingSenderId: '375486720938',
    projectId: 'food-hood',
    storageBucket: 'food-hood.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAG9gStb-SD8TY1gRCx3IVQ0bv5_Y7iuq8',
    appId: '1:375486720938:ios:9d4ef72d876851fe8959d3',
    messagingSenderId: '375486720938',
    projectId: 'food-hood',
    storageBucket: 'food-hood.appspot.com',
    iosClientId: '375486720938-oqn0c86e4msh3l0labe77u1mquvtkf7g.apps.googleusercontent.com',
    iosBundleId: 'com.example.social',
  );
}
