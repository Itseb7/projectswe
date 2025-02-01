import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBNovI9wOGs4SqSVKJSEVvQoNxNV9K1ExQ",
            authDomain: "loog-35cd6.firebaseapp.com",
            projectId: "loog-35cd6",
            storageBucket: "loog-35cd6.firebasestorage.app",
            messagingSenderId: "792483530411",
            appId: "1:792483530411:web:b9c47f7e8da9f260d299ee",
            measurementId: "G-X9LJH0F1JD"));
  } else {
    await Firebase.initializeApp();
  }
}
