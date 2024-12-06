import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDb78BtZ0yzBBT5KftP-AwKcx-Y-kbeEK8",
            authDomain: "silva-43149.firebaseapp.com",
            projectId: "silva-43149",
            storageBucket: "silva-43149.appspot.com",
            messagingSenderId: "261214133662",
            appId: "1:261214133662:web:fdeb832f2cb1efcf884a8f",
            measurementId: "G-MG68H3NMQ5"));
  } else {
    await Firebase.initializeApp();
  }
}
