import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gymbodybuilding/authentication/login.dart';
import 'package:gymbodybuilding/screens/already_created_room.dart';
import 'package:gymbodybuilding/screens/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login(),

      );
    }
  }
