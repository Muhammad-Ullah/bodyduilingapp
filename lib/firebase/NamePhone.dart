

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
                        hintText: 'Username',
                        prefixIcon: Icon(
                          Icons.person_outline, color: Color(primareyColor),),
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
                  )
              ),

              Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  child: Center(
                    child: TextFormField(
                      controller: phoneController,
                      validator: (val) =>
                      ph_no.length < 12
                          ? "Phone number is missing"
                          : null,
                      onChanged: (val) {
                        setState(() {
                          ph_no = val;
                        });
                      },
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        prefixIcon: Icon(
                          Icons.phone, color: Color(primareyColor),),
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
                            hintText: 'Age',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Color(whitness),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                              BorderSide(color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Color(primareyColor), width: 2),
                            ),
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
                            hintText: 'height',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Color(whitness),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                              BorderSide(color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Color(primareyColor), width: 2),
                            ),
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
                            hintText: 'Weight',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Color(whitness),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                              BorderSide(color: Colors.white, width: 0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Color(primareyColor), width: 0),
                            ),
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
