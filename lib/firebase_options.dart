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
    apiKey: 'AIzaSyAFrbu2BJNXUe9X0FnyvoptN-a6GT73csI',
    appId: '1:462393328045:web:9116e56a42af8f677c2124',
    messagingSenderId: '462393328045',
    projectId: 'tolker-1675f',
    authDomain: 'tolker-1675f.firebaseapp.com',
    storageBucket: 'tolker-1675f.appspot.com',
    measurementId: 'G-02L8V04HBW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBu0t2vYCaofyySbf4ikgTulcq-RARsMDo',
    appId: '1:462393328045:android:77a749703b1dd83e7c2124',
    messagingSenderId: '462393328045',
    projectId: 'tolker-1675f',
    storageBucket: 'tolker-1675f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD35mCpmTRx9g43MG_Mj27mCvbKt8r0GYc',
    appId: '1:462393328045:ios:ed3bc87902ec19087c2124',
    messagingSenderId: '462393328045',
    projectId: 'tolker-1675f',
    storageBucket: 'tolker-1675f.appspot.com',
    iosBundleId: 'com.example.tolker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD35mCpmTRx9g43MG_Mj27mCvbKt8r0GYc',
    appId: '1:462393328045:ios:ed3bc87902ec19087c2124',
    messagingSenderId: '462393328045',
    projectId: 'tolker-1675f',
    storageBucket: 'tolker-1675f.appspot.com',
    iosBundleId: 'com.example.tolker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAFrbu2BJNXUe9X0FnyvoptN-a6GT73csI',
    appId: '1:462393328045:web:9be55773f563324c7c2124',
    messagingSenderId: '462393328045',
    projectId: 'tolker-1675f',
    authDomain: 'tolker-1675f.firebaseapp.com',
    storageBucket: 'tolker-1675f.appspot.com',
    measurementId: 'G-HQ9P4EF8H9',
  );
}
