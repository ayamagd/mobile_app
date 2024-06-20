import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Home.dart';
import 'package:flutter_application_1/pages/Speed.dart';
import 'package:flutter_application_1/pages/constants.dart';
import 'package:flutter_application_1/pages/mainScreen.dart';
void main() {
    WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final Future<FirebaseApp> firebaseinitilization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
     future: firebaseinitilization,
 builder: (context, snapshot) {
  return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(scaffoldBackgroundColor: kcolor5),
        home:  mainScreen(),
      
      );
 }
    );
  }
}
