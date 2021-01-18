

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gymbodybuilding/firebase/AuthenticationService.dart';
import 'package:gymbodybuilding/firebase/DatabaseManager.dart';
import 'package:gymbodybuilding/firebase/auth.dart';
import 'package:gymbodybuilding/models/constants.dart';
import 'package:gymbodybuilding/screens/chat_screen.dart';

import '../loading.dart';
import 'login.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  final AuthenticationService _auth = AuthenticationService();
  final _formkey=GlobalKey<FormState>();
  final AuthService _authService=AuthService();
  String email='';
  String name='';
  String ph_no='';
  String password='';
  bool loading=false;
  String error="";
  List gender=["Male","Female","Other"];
  var _isLoadingSignUp=false;

  String select;
  List userProfilesList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList();
  }

  fetchUserInfo() async {
    User getUser = await FirebaseAuth.instance.currentUser;
    userID = getUser.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }
  createData(String name, String phone, String userID) async {
    await DatabaseManager().createNamePhone(name, phone, userID);
    fetchDatabaseList();
  }
  @override
  Widget build(BuildContext context) {
    return _isLoadingSignUp?Loading("sign up"): Scaffold(
      backgroundColor: Color(mainColor),
      appBar: AppBar(title: Text('Sign Up'),
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
               Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 50,
                    child: Center(
                        child: TextFormField(
                          controller: _nameController,
                         // validator: (val)=>val.isEmpty? "This field cannot be empty":null,
                          onChanged: (val)
                          {
                            setState(() {
                              name=val;
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
                            hintText: "Username",
                          ),
                        ),
                    )
                ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  child: Center(
                    child: TextFormField(
                      //validator: (val)=>val.isEmpty? "Enter an email":null,
                      onChanged: (val)
                      {
                        setState(() {
                          email=val;
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
                  height: 50,
                  child: Center(
                    child: TextFormField(
                     // validator: (val)=>val.length<6? "Enter password 6 characters":null,
                      obscureText: true,
                      onChanged: (val)
                      {
                        setState(() {
                          password=val;
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
                  height: 50,
                  child: Center(
                    child: TextFormField(
                      //validator: (val)=>password!=val? "Password did not match":null,
                      onChanged: (val)
                      {
                        setState(() {

                        });
                      },
                      obscureText: true,
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
                        hintText: "Confirm Password",
                      ),
                    ),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  child: Center(
                    child: TextFormField(
                      controller: _phoneController,
                     // validator: (val)=>ph_no.length<12 ? "Phone number is missing":null,
                      onChanged: (val)
                      {
                        setState(() {
                            ph_no=val;
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
                        hintText: "Phone number",
                      ),
                    ),
                  )
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10,right: 5),
                      height: 50,
                      child: Center(
                        child: TextField(
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
                            hintText: "Age",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10,left: 5,right: 5),
                      height: 50,
                      child: Center(
                        child: TextField(
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
                            hintText: "Height",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10,left:5,),
                      height: 50,
                      child: Center(
                        child: TextField(
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
                            hintText: "Weight",
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text("Gender:",style: TextStyle(color: Color(primareyColor),fontSize: 20),),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    addRadioButton(0, 'Male'),
                    addRadioButton(1, 'Female'),
                    addRadioButton(2, 'Other')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 10,
                height: 40,
                child: RaisedButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Color(primareyColor),
                  onPressed: ()
                  async {
                    setState(() {
                      _isLoadingSignUp=true;
                    });
                      if (_formkey.currentState.validate()) {
                       createUser();
                       submitAction(context);
                       setState(() {
                         _isLoadingSignUp=false;
                       });

                       showToast("Sign Up successfully");

                      }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Center(
                    child: goToSignUp(),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value){
            setState(() {
              print(value);
              select=value;
            });
          },
        ),
        Text(title,style: TextStyle(color: Colors.white),)
      ],
    );
  }
  Widget goToSignUp() {
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 15.0);
    TextStyle linkStyle = TextStyle(color: Color(primareyColor),fontSize: 20);
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: "Already have an account?",style: TextStyle(color: Colors.white)),
          TextSpan(
              text:" Sign In?",
              style: linkStyle,
              recognizer: TapGestureRecognizer()..onTap = ()
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login()));
              }
          ),
        ],
      ),
    );
  }
  void createUser() async {
    try {
      dynamic result = await _auth.createNewUser(
          "", email, password);
      if (result == null) {
        showAlertDialog(context,"Try different email");
      } else {
        print(result.toString());
        email="";
        password='';
        Navigator.pop(context);
      }
    }
    catch(e)
    {
      showAlertDialog(context,"Check your internet connection");
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
      title: Text("Unable to sign up"),
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
  submitAction(BuildContext context) {
    createData(_nameController.text, _phoneController.text, userID);
    _nameController.clear();
    _phoneController.clear();
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
