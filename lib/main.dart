import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/firebase_api.dart';
import 'package:campus_event_app/screens/openscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseApi().initNotifications();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      default:
        return FirebaseOptions(
          apiKey: 'AIzaSyA6jVrqoD1VNvKhZ3jiMr9MKH2sNsBzzt4',
          appId: '1:953989752029:android:34894ab7a699ae0dce2734',
          messagingSenderId: '953989752029',
          projectId: 'campus-event-app-b9bdb',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6jVrqoD1VNvKhZ3jiMr9MKH2sNsBzzt4',
    appId: '1:953989752029:android:34894ab7a699ae0dce2734',
    messagingSenderId: '953989752029',
    projectId: 'campus-event-app-b9bdb',
    // databaseURL:
    //     'https://campus-event-app-b9bdb-default-rtdb.asia-southeast1.firebasedatabase.app/',
    // storageBucket: 'campus-event-app-b9bdb.firebasestorage.app',
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    fetchDocument();
    return MaterialApp(
      home: OpenScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
