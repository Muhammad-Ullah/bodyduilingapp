


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gymbodybuilding/authentication/signup.dart';
import 'package:gymbodybuilding/firebase/NamePhone.dart';
import 'package:gymbodybuilding/firebase/auth.dart';
import 'package:gymbodybuilding/models/constants.dart';
//import 'package:gymbodybuilding/screens/buttom_navigation/main_bottom_navigation.dart';
import 'package:gymbodybuilding/screens/room_system.dart';
import 'package:gymbodybuilding/screens/splashscreen.dart';

import '../screens/forgot_password.dart';
import 'signup.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final gooleSignIn = GoogleSignIn();
  final _formkey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';
  bool loading = false;
  String error = '';
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(mainColor),
      appBar: AppBar(title: Text('Login'),
        backgroundColor: Color(mainColor),),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  child: Center(
                    child: TextFormField(

                      //validator: (val) => val.isEmpty ? "Enter an email" : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      autocorrect: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange, width: 1.0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: "Email",
                      ),
                    ),
                  )
              ),

              Container(
                  margin: EdgeInsets.only(top: 10),
                  height:50,
                  child: Center(
                    child: TextFormField(

                      // validator: (val) =>
                      // val.length < 6
                      //     ? "Your Password is greater than 6 characters"
                      //     : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      autocorrect: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange, width: 1.0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: "Password",
                      ),
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 10,
                height: 40,
                child: RaisedButton(
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Color(primareyColor),
                  onPressed: ()  async{
                    if (_formkey.currentState.validate()) {
                      try {
                        dynamic result = await _authService
                            .SignInWithEmailAndPassword(email, password);
                        if (result!=null)
                          Navigator.push((context), MaterialPageRoute(builder: (context) => RoomSystem()));

                      }catch(e)
                    {
                      showAlertDialog(context, "Password and email do not match");

                    }
                    }

                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: ()
                {
                  Navigator.push((context), MaterialPageRoute(builder: (context) => ForgotPassword()));
                }
                ,
                child: Align(
                 alignment: Alignment.topRight,
                    child: Container(
                      child: Text("Forgot password?"
                      ),
                    ),

                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                child: Center(
                  child: Text('-OR-',style: TextStyle(fontSize: 15,color: Color(primareyColor)),),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                child: RaisedButton(
                  child: Text("Sign In with apple"),
                  onPressed: ()
                    {
                      //Navigator.push((context), MaterialPageRoute(builder: (context) => SplashScreen()));
                    },

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 10),
              //   height: 45,
              //   child:RaisedButton
              //     (
              //     child: Text("Sign In with facebook"),
              //     onPressed: (){
              //
              //   },
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10)
              //     ),
              //
              //   ),
              // ),
              Container(
                height: 45,
                margin: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  child:Text("Sign in with google"),
                  onPressed: ()
                  {
                      googleSignIn();
                      Navigator.push((context), MaterialPageRoute(builder: (context) => NamePhone()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),


                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  child: goToSignUp(),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget goToSignUp() {
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 15.0);
    TextStyle linkStyle = TextStyle(color: Color(primareyColor),fontSize: 20);
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: "Don't have an account?",style: TextStyle(color: Colors.white)),
          TextSpan(
              text:" Sign Up?",
              style: linkStyle,
              recognizer: TapGestureRecognizer()..onTap = ()
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUp()));
              }
          ),
        ],
      ),
    );
  }


  Future<bool> googleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await gooleSignIn.signIn();

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      UserCredential  result = await auth.signInWithCredential(credential);

      User user = await auth.currentUser;
      showAlertDialog2(context, user.email);

      return Future.value(true);
    }
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
}
