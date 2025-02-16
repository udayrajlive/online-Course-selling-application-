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
    apiKey: 'AIzaSyDFHGdsoO17CxZZL3Bcuee6EYfsbHzbguc',
    appId: '1:973389061375:web:95c38c653e24ae663180ca',
    messagingSenderId: '973389061375',
    projectId: 'courseomatic-84a33',
    authDomain: 'courseomatic-84a33.firebaseapp.com',
    storageBucket: 'courseomatic-84a33.appspot.com',
    measurementId: 'G-670H22ZNDC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwv1BFxrpl_JFwdwf_44QWMjVnuYNYXf8',
    appId: '1:973389061375:android:6da61fa7b5aa029a3180ca',
    messagingSenderId: '973389061375',
    projectId: 'courseomatic-84a33',
    storageBucket: 'courseomatic-84a33.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZWIjTXknrLkUiUtcbMyY1tEM-bfaDe48',
    appId: '1:973389061375:ios:b51d9fffb48a1ac23180ca',
    messagingSenderId: '973389061375',
    projectId: 'courseomatic-84a33',
    storageBucket: 'courseomatic-84a33.appspot.com',
    iosBundleId: 'com.example.courseSellingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZWIjTXknrLkUiUtcbMyY1tEM-bfaDe48',
    appId: '1:973389061375:ios:75cc410e32b2b11a3180ca',
    messagingSenderId: '973389061375',
    projectId: 'courseomatic-84a33',
    storageBucket: 'courseomatic-84a33.appspot.com',
    iosBundleId: 'com.example.courseSellingApp.RunnerTests',
  );
}
