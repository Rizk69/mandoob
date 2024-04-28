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
    apiKey: 'AIzaSyBDRo5voN7F0xzr9NwW85RyXpdWtrLx3dU',
    appId: '1:1041381962651:web:c5824b1221521437f5673e',
    messagingSenderId: '1041381962651',
    projectId: 'mandoob-b6b24',
    authDomain: 'mandoob-b6b24.firebaseapp.com',
    storageBucket: 'mandoob-b6b24.appspot.com',
    measurementId: 'G-N1Y81S83BM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5LsvenE0zM_teM2Bk1zSZAXvzAL2hZLk',
    appId: '1:1041381962651:android:f88cf14b6f5cb415f5673e',
    messagingSenderId: '1041381962651',
    projectId: 'mandoob-b6b24',
    storageBucket: 'mandoob-b6b24.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtwFPhOjTABlLOFAMcEeDwL9QPxiX2c2I',
    appId: '1:1041381962651:ios:728b2f6571a70748f5673e',
    messagingSenderId: '1041381962651',
    projectId: 'mandoob-b6b24',
    storageBucket: 'mandoob-b6b24.appspot.com',
    iosBundleId: 'com.mashura.mozakrety',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtwFPhOjTABlLOFAMcEeDwL9QPxiX2c2I',
    appId: '1:1041381962651:ios:02f6c28a11c35db6f5673e',
    messagingSenderId: '1041381962651',
    projectId: 'mandoob-b6b24',
    storageBucket: 'mandoob-b6b24.appspot.com',
    iosBundleId: 'com.example.mandoobFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBDRo5voN7F0xzr9NwW85RyXpdWtrLx3dU',
    appId: '1:1041381962651:web:bc20bcf07a9686c3f5673e',
    messagingSenderId: '1041381962651',
    projectId: 'mandoob-b6b24',
    authDomain: 'mandoob-b6b24.firebaseapp.com',
    storageBucket: 'mandoob-b6b24.appspot.com',
    measurementId: 'G-3GBYH3KKVM',
  );
}
