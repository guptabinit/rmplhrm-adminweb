import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
    apiKey: 'AIzaSyCERFPJbkKo1NAcgcBlBq0PE79MfR9sz_Y',
    appId: '1:650911172279:web:3650689bc4bd1dc36c2f32',
    messagingSenderId: '650911172279',
    projectId: 'rmpl-hrm',
    authDomain: 'rmpl-hrm.firebaseapp.com',
    storageBucket: 'rmpl-hrm.appspot.com',
    measurementId: 'G-BLSC3ZQCP0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXcIblaRRZf4vKA8ty_7j-ONuWBOuwOuY',
    appId: '1:650911172279:android:a527058b7483511a6c2f32',
    messagingSenderId: '650911172279',
    projectId: 'rmpl-hrm',
    storageBucket: 'rmpl-hrm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCW9vVwvFsZyQUpbvwiHcLWxhRWcVo78Oo',
    appId: '1:650911172279:ios:8257b163c376a89a6c2f32',
    messagingSenderId: '650911172279',
    projectId: 'rmpl-hrm',
    storageBucket: 'rmpl-hrm.appspot.com',
    iosBundleId: 'com.rmplhrm.rmplHrmAdmin',
  );
}
