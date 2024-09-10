import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
          apiKey: "AIzaSyDqfackIDoC8C-RnXzwt-B3YJp2RctO2yQ",
          authDomain: "micrositio-a9b1f.firebaseapp.com",
          projectId: "micrositio-a9b1f",
          storageBucket: "micrositio-a9b1f.appspot.com",
          messagingSenderId: "112888440286",
          appId: "1:112888440286:web:cfd6cca1ea7a09b41b694f",
          measurementId: "G-T5TS080FLP"
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
          apiKey: "AIzaSyDqfackIDoC8C-RnXzwt-B3YJp2RctO2yQ",
          authDomain: "micrositio-a9b1f.firebaseapp.com",
          projectId: "micrositio-a9b1f",
          storageBucket: "micrositio-a9b1f.appspot.com",
          messagingSenderId: "112888440286",
          appId: "1:112888440286:web:cfd6cca1ea7a09b41b694f",
          measurementId: "G-T5TS080FLP"
      );
    } else {
      // Android
      return const FirebaseOptions(
          apiKey: "AIzaSyDqfackIDoC8C-RnXzwt-B3YJp2RctO2yQ",
          authDomain: "micrositio-a9b1f.firebaseapp.com",
          projectId: "micrositio-a9b1f",
          storageBucket: "micrositio-a9b1f.appspot.com",
          messagingSenderId: "112888440286",
          appId: "1:112888440286:web:cfd6cca1ea7a09b41b694f",
          measurementId: "G-T5TS080FLP"
      );
    }
  }
}
