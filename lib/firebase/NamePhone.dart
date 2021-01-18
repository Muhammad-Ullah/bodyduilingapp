

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gymbodybuilding/firebase/AuthenticationService.dart';
import 'package:gymbodybuilding/firebase/DatabaseManager.dart';
import 'package:gymbodybuilding/firebase/auth.dart';
import 'package:gymbodybuilding/models/constants.dart';
import 'package:gymbodybuilding/screens/already_created_room.dart';
import 'package:gymbodybuilding/screens/create_room.dart';



class NamePhone extends StatefulWidget {
  @override
  _NamePhoneState createState() => _NamePhoneState();
}

class _NamePhoneState extends State<NamePhone> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
    return Scaffold(
      backgroundColor: Color(mainColor),
      appBar: AppBar(title: Text('Your Info'),
        backgroundColor: Color(mainColor),),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  child: Center(
                    child: TextFormField(
                      controller: nameController,
                      validator: (val) =>
                      val.isEmpty
                          ? "This field cannot be empty"
                          : null,
                      onChanged: (val) {
                        setState(() {
                          name = val;
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
                      controller: phoneController,
                      // validator: (val) =>
                      // ph_no.length < 12
                      //     ? "Phone number is missing"
                      //     : null,
                      onChanged: (val) {
                        setState(() {
                          ph_no = val;
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
                      margin: EdgeInsets.only(top: 10, right: 5),
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
                      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
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
                      margin: EdgeInsets.only(top: 10, left: 5,),
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
                margin: EdgeInsets.only(top: 10),
                width: 10,
                height: 40,
                child: RaisedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Color(primareyColor),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      submitAction(context);
                      Navigator.push((context), MaterialPageRoute(builder: (context) => CreateRoom()));
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
      title: Text("Unable to get your information"),
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
  createData(nameController.text, phoneController.text, userID);
  nameController.clear();
  phoneController.clear();
}
}
