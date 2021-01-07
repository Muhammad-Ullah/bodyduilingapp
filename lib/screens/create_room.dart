

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymbodybuilding/firebase/DatabaseManager.dart';
import 'package:gymbodybuilding/models/constants.dart';
import 'package:gymbodybuilding/screens/already_created_room.dart';
import 'friendpage.dart';


class CreateRoom extends StatefulWidget {
  @override
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _scoreController = TextEditingController();

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
  updateData(String name, String gender, int score, String userID) async {
    await DatabaseManager().createUserData(name, gender, score, userID);
    fetchDatabaseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(mainColor),
      appBar: AppBar(title: Text('Create Room'),
        elevation: 0,
        backgroundColor: Color(mainColor),),

      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [

            SizedBox(
              height: 50,
            ),

            Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                child: Center(
                  child: TextField(
                    controller: _nameController,
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Room Name',
                      //prefixIcon: Icon(Icons.lock,color: Color(primareyColor),),
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
                    validator: (val) =>
                    val.length >= 10
                        ? "Participants should be less than or eqaul to 10"
                        : null,
                    controller: _genderController,
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Chose number of people in room',
                      //prefixIcon: Icon(Icons.lock,color: Color(primareyColor),),
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
                    validator: (val) =>
                    val.length > 20
                        ? "Work out length should be less than 20"
                        : null,
                    controller: _scoreController,
                    autocorrect: true,

                    decoration: InputDecoration(
                      hintText: 'Enter workout length',
                      //prefixIcon: Icon(Icons.lock,color: Color(primareyColor),),
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
              width: 10,
              height: 40,
              child: RaisedButton(
                child: Text(
                  "Create Room",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Color(primareyColor),
                onPressed:() {
                  submitAction(context);
                  Navigator.push((context), MaterialPageRoute(builder: (context)=>FriendsPage()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),

          ],
        ),
      ),

    );
  }

  submitAction(BuildContext context) {
    updateData(_nameController.text, _genderController.text,
        int.parse(_scoreController.text), userID);
    _nameController.clear();
    _genderController.clear();
    _scoreController.clear();
  }
}
