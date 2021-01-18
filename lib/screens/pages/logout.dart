import 'package:gymbodybuilding/screens/bloc.navigation_bloc/navigation_bloc.dart';
//import 'package:brain_dareus_ministries/constant.dart';
import 'package:flutter/material.dart';


class Logout extends StatefulWidget with NavigationStates {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {


 bool check=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(

        child: Center(
          child: RaisedButton(
            child: Text("show Dialoge"),
            onPressed: ()
            {
              showcontent();
            },
          ),
        ),



      ),
    );
  }


  void showcontent() {

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(

            title: Text('Logout'),
            content: const Text(
                'Are you sure do you want to logout',style: TextStyle(color: Colors.grey),),
            actions: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      FlatButton(
                        child: const Text('ACCEPT',style: TextStyle(color: Colors.red),),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: const Text('CANCLE',),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],

                ),
              ),

            ],
          );
        });
  }
}
