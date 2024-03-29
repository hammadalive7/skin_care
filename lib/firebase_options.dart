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
    apiKey: 'AIzaSyALQFOwbstAXrUr7pSofB6KeTPWiuWJmJ0',
    appId: '1:86691516119:web:d29b4fa46a8128c2f1aa92',
    messagingSenderId: '86691516119',
    projectId: 'skin-care-app-d1ee9',
    authDomain: 'skin-care-app-d1ee9.firebaseapp.com',
    storageBucket: 'skin-care-app-d1ee9.appspot.com',
    measurementId: 'G-WE5H08JT57',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDNa4dEvLxvHC7RdgChQKNCZWXn6GGLC4',
    appId: '1:86691516119:android:f93f65330c2c3710f1aa92',
    messagingSenderId: '86691516119',
    projectId: 'skin-care-app-d1ee9',
    storageBucket: 'skin-care-app-d1ee9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAw7rsxLZ8LxLVjB_HxqJ-WAP48_ij9tmA',
    appId: '1:86691516119:ios:91762f24490fb3a2f1aa92',
    messagingSenderId: '86691516119',
    projectId: 'skin-care-app-d1ee9',
    storageBucket: 'skin-care-app-d1ee9.appspot.com',
    iosBundleId: 'com.xamdesign.shoeApp',
  );
}
