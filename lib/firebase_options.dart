import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      // case TargetPlatform.android:
      //   return android;
      case TargetPlatform.iOS:
        return ios;
      // case TargetPlatform.macOS:
      //   return macos;
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
      apiKey: "AIzaSyBrNgodmlmxOvDi3dSaw4X6dJVEH32hoxY",
      authDomain: "humsafar-a1f9a.firebaseapp.com",
      projectId: "humsafar-a1f9a",
      storageBucket: "humsafar-a1f9a.appspot.com",
      messagingSenderId: "607397488207",
      appId: "1:607397488207:web:95b3dca4c7159444baec3a");

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDD7N-PBPHdPj5ibUsV2MD-CK0qs1ZRMdw',
    appId: '1:832047530383:android:bf2d8bcba221c238070bfa',
    projectId: 'myincentives',
    storageBucket: 'myincentives.appspot.com',
    messagingSenderId: '832047530383',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAY44K7YKi3kYUGsQcl7vIx-Ed0Jb1gMTM',
    appId: ':832047530383:ios:9ae761fbe03b7145070bfa',
    messagingSenderId: '832047530383',
    projectId: 'myincentives',
    // databaseURL:
    //     'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
    // storageBucket: 'flutterfire-e2e-tests.appspot.com',
    // androidClientId:
    //     '406099696497-17qn06u8a0dc717u8ul7s49ampk13lul.apps.googleusercontent.com',
    // iosClientId:
    //     '406099696497-irb7edfevfkhi6t5s9kbuq1mt1og95rg.apps.googleusercontent.com',
    // iosBundleId: 'io.flutter.plugins.firebase.messaging',
  );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'AIzaSyDooSUGSf63Ghq02_iIhtnmwMDs4HlWS6c',
  //   appId: '1:406099696497:ios:1b423b89c63b82053574d0',
  //   messagingSenderId: '406099696497',
  //   projectId: 'flutterfire-e2e-tests',
  //   databaseURL:
  //       'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
  //   storageBucket: 'flutterfire-e2e-tests.appspot.com',
  //   androidClientId:
  //       '406099696497-17qn06u8a0dc717u8ul7s49ampk13lul.apps.googleusercontent.com',
  //   iosClientId:
  //       '406099696497-irb7edfevfkhi6t5s9kbuq1mt1og95rg.apps.googleusercontent.com',
  //   iosBundleId: 'io.flutter.plugins.firebase.messaging',
  // );
}
