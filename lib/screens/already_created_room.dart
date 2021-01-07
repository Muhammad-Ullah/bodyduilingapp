import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymbodybuilding/firebase/DatabaseManager.dart';
import 'package:gymbodybuilding/models/constants.dart';


class AlreadyCreatedRooms extends StatefulWidget {
  @override
  _AlreadyCreatedRoomsState createState() => _AlreadyCreatedRoomsState();
}

class _AlreadyCreatedRoomsState extends State<AlreadyCreatedRooms> {

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
        appBar: AppBar(title: Text('Already created rooms',),
          elevation: 0,
          backgroundColor: Color(mainColor)),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("profileInfo").snapshots(),
        builder: (context,snapshot)
        {
            if(snapshot.data==null)
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
             return ListView.builder(
                 itemCount: snapshot.data.docs.length,
                 itemBuilder: (context,index)
                 {
                   DocumentSnapshot course=snapshot.data.documents[index];
                   return ListTile(
                     leading: CircleAvatar(
                       child: Icon(Icons.ac_unit),
                     ),
                     title: Text(course['roomname']),
                     subtitle: Text(course['Participants']),
                   );
                 });

        },
      )
    );
  }
}
