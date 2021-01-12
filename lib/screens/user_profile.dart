

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gymbodybuilding/firebase/DatabaseManager.dart';
import 'package:gymbodybuilding/models/constants.dart';
import 'package:gymbodybuilding/screens/room_system.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formkey=GlobalKey<FormState>();
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
    User getUser = FirebaseAuth.instance.currentUser;
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
    //fetchDatabaseList();
  }
  @override
  Widget build(BuildContext context) {

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async{
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Profile'),
      ),
      body:  ListView(
               // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Color(0xff476cfb),
                          child: ClipOval(
                            child: new SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (_image!=null)?Image.file(
                                _image,
                                fit: BoxFit.fill,
                              ):Image.network(
                                "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            size: 30.0,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                          children: [
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
                          ],
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Color(mainColor),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      RaisedButton(
                        color: Color(mainColor),
                        onPressed: () {
                          submitAction(context);
                          uploadPic(context);
                          Navigator.push((context), MaterialPageRoute(builder: (context)=>RoomSystem()));

                        },
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),

                    ],
                  )
                ],
              ),

    );
  }
  submitAction(BuildContext context) {
    createData(nameController.text, phoneController.text, userID);
    nameController.clear();
    phoneController.clear();
  }
}