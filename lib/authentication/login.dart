


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gymbodybuilding/authentication/signup.dart';
import 'package:gymbodybuilding/firebase/NamePhone.dart';
import 'package:gymbodybuilding/firebase/auth.dart';
import 'package:gymbodybuilding/models/constants.dart';
import 'package:gymbodybuilding/screens/room_system.dart';


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
                      validator: (val) => val.isEmpty ? "Enter an email" : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'email id',
                        prefixIcon: Icon(Icons.person_outline,color: Color(primareyColor),),
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Color(whitness),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 0),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  height:50,
                  child: Center(
                    child: TextFormField(
                      validator: (val) =>
                      val.length < 6
                          ? "Your Password is greater than 6 characters"
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock,color: Color(primareyColor),),
                        hintStyle: TextStyle(color: Colors.grey,),
                        filled: true,
                        fillColor: Color(whitness),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 0),
                        ),
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
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                child: Center(
                  child: Text('-OR-',style: TextStyle(fontSize: 20,color: Color(primareyColor)),),
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
                    {},

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                child:RaisedButton
                  (
                  child: Text("Sign In with facebook"),
                  onPressed: (){

                },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),

                ),
              ),
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


            ],
          ),
        ),
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
