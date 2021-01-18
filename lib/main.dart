import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gymbodybuilding/screens/buttom_navigation/main_bottom_navigation.dart';

import 'package:gymbodybuilding/screens/splashscreen.dart';
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
          return Home();
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

