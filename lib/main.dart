import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gymbodybuilding/authentication/login.dart';
import 'package:gymbodybuilding/firebase/auth.dart';
import 'package:gymbodybuilding/screens/already_created_room.dart';
import 'package:gymbodybuilding/screens/room_system.dart';
import 'package:gymbodybuilding/screens/splashscreen.dart';
import 'package:gymbodybuilding/screens/user_profile.dart';
import 'package:gymbodybuilding/ui/screens/home.dart';

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
      home:StreamBuilder(
          stream:FirebaseAuth.instance.authStateChanges(),

          builder:(context,snapshot)
      {
        if(snapshot.connectionState==ConnectionState.active) {
          User user = snapshot.data;
          if(user==null)
            return SplashScreen();
          return HomeScreen();
        }
        else
          {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

      }),

      );
    }
  }

