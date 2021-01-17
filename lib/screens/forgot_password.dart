


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gymbodybuilding/authentication/login.dart';
import 'package:gymbodybuilding/firebase/auth.dart';
import 'package:gymbodybuilding/models/constants.dart';

import '../loading.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  var email="";
  final _formkey = GlobalKey<FormState>();
  var _isLoadingForgot = false;
  @override
  Widget build(BuildContext context) {
    return _isLoadingForgot?Loading("Sending email..."): Scaffold(
      backgroundColor: Color(mainColor),
      body:Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Text("We will mail you a link please click on that to reset your password:"),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Center(
                child: TextFormField(
                  validator:(value){
                    if(value.isEmpty)
                      {
                        return "plz enter email";
                      }
                    else{
                      email=value;
                    }
                  },
                  onChanged: (val)
                  {
                    setState(() {
                      email=val;
                    });
                  },
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Enter email',
                    prefixIcon: Icon(Icons.person_outline,color: Color(primareyColor),),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(whitness),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 2),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,left: 20,right: 20),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: RaisedButton(
                child: Text(
                  "Send email",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Color(primareyColor),
                onPressed: ()
                 {
                   setState(() {
                     _isLoadingForgot=true;
                   });
                    if(_formkey.currentState.validate())
                      {
                        FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => print("check your email"));

                      }

                    showToast("Please check your email");
                    //showAlertDialog(context, "email has been sent to you");
                    Navigator.push((context), MaterialPageRoute(builder: (context) => Login()));

                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      )
    );

  }
  showAlertDialog(BuildContext context,String msg) {

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Unable to sign in"),
      content: Text('$msg'),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showAlertDialog2(BuildContext context,String msg) {

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Successfully logged in"),
      content: Text('$msg'),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.red,
        fontSize: 16.0
    );
  }
}
