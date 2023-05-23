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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA0A8-w0h5tpB9hOrrTmRDnVBvkv_a7FuM',
    appId: '1:569988390716:web:05b37186d7fe2160604839',
    messagingSenderId: '569988390716',
    projectId: 'walkini-f6669',
    authDomain: 'walkini-f6669.firebaseapp.com',
    storageBucket: 'walkini-f6669.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8QDP3X5EZYiUgXZgZELjU5wmdk50hh-g',
    appId: '1:569988390716:android:4d153f10c7cb6ec1604839',
    messagingSenderId: '569988390716',
    projectId: 'walkini-f6669',
    storageBucket: 'walkini-f6669.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeHJy8JUyuaGGjE77yClF3dN3VeRJyHro',
    appId: '1:569988390716:ios:762f940ff5e360ad604839',
    messagingSenderId: '569988390716',
    projectId: 'walkini-f6669',
    storageBucket: 'walkini-f6669.appspot.com',
    iosClientId: '569988390716-hfeo80ge594nmb4ca2gs7jnujctvdtrb.apps.googleusercontent.com',
    iosBundleId: 'com.BourouisMohamedAmine.startUpProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeHJy8JUyuaGGjE77yClF3dN3VeRJyHro',
    appId: '1:569988390716:ios:762f940ff5e360ad604839',
    messagingSenderId: '569988390716',
    projectId: 'walkini-f6669',
    storageBucket: 'walkini-f6669.appspot.com',
    iosClientId: '569988390716-hfeo80ge594nmb4ca2gs7jnujctvdtrb.apps.googleusercontent.com',
    iosBundleId: 'com.BourouisMohamedAmine.startUpProject',
  );
}
