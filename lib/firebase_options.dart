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
    apiKey: 'AIzaSyDftfmo-OFJmBaPt7wvrwN3D_Ll9AMO-D0',
    appId: '1:778271094688:web:e3501388f01c34461f56c5',
    messagingSenderId: '778271094688',
    projectId: 'appetec-44972',
    authDomain: 'appetec-44972.firebaseapp.com',
    storageBucket: 'appetec-44972.firebasestorage.app',
    measurementId: 'G-BM56EVNJBT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxKbB55tYNgG-Ezqxt1Qu2shoAwJH-Whs',
    appId: '1:778271094688:android:85039ae063a754b41f56c5',
    messagingSenderId: '778271094688',
    projectId: 'appetec-44972',
    storageBucket: 'appetec-44972.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7_UZbc8suSSBoOz36DWhRbZPlX8H84Dw',
    appId: '1:778271094688:ios:3865a157d43039ea1f56c5',
    messagingSenderId: '778271094688',
    projectId: 'appetec-44972',
    storageBucket: 'appetec-44972.firebasestorage.app',
    iosBundleId: 'com.example.appetec',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7_UZbc8suSSBoOz36DWhRbZPlX8H84Dw',
    appId: '1:778271094688:ios:3865a157d43039ea1f56c5',
    messagingSenderId: '778271094688',
    projectId: 'appetec-44972',
    storageBucket: 'appetec-44972.firebasestorage.app',
    iosBundleId: 'com.example.appetec',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDftfmo-OFJmBaPt7wvrwN3D_Ll9AMO-D0',
    appId: '1:778271094688:web:1e7abf3bfb6fd0331f56c5',
    messagingSenderId: '778271094688',
    projectId: 'appetec-44972',
    authDomain: 'appetec-44972.firebaseapp.com',
    storageBucket: 'appetec-44972.firebasestorage.app',
    measurementId: 'G-P50484D7SP',
  );
}
