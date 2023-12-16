import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movieapp/pages/first_page.dart';

late FirebaseApp app;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAV0Z92b6-rs7qZ-rAO_drSHccCJbmpq1g",
          appId: "1:624616412260:android:d9efa0723b884a43f0bb71",
          messagingSenderId: "624616412260",
          projectId: "music-app-a080f"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData.dark(),
      home: firstPage(),
      debugShowCheckedModeBanner: false, 
    );
  }
}
