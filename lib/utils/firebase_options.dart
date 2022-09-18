import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart';

/// [DefaultFirebaseOptions] use with your app
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidOption;
      case TargetPlatform.iOS:
        return iosOptions;
      case TargetPlatform.fuchsia:
        break;
      case TargetPlatform.linux:
        break;
      case TargetPlatform.macOS:
        break;
      case TargetPlatform.windows:
        break;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions androidOption = FirebaseOptions(
    apiKey: 'apiKey',
    appId: 'appId',
    messagingSenderId: 'messagingSenderId',
    projectId: 'projectId',
  );

  static const FirebaseOptions iosOptions = FirebaseOptions(
    apiKey: 'apiKey',
    appId: 'appId',
    messagingSenderId: 'messagingSenderId',
    projectId: 'projectId',
  );
}
