import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBq8gua8yF8GRAl2SB9jBXHDaynsZICTc0",
            authDomain: "helioscan-helios.firebaseapp.com",
            projectId: "helioscan-helios",
            storageBucket: "helioscan-helios.appspot.com",
            messagingSenderId: "137838190489",
            appId: "1:137838190489:web:2c9e600bb2fecbc07cbd08",
            measurementId: "G-ZLP0DTQ9N8"));
  } else {
    await Firebase.initializeApp();
  }
}
