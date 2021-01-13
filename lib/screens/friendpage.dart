
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymbodybuilding/firebase/DatabaseManager.dart';
import 'package:gymbodybuilding/models/constants.dart';

import 'chat_screen.dart';

class FriendsPage extends StatefulWidget {

  @override
  _FriendsPageState createState() => new _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {

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
    dynamic resultant = await DatabaseManager().getNamePhone();

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

  TextEditingController editingController = TextEditingController();

  List<String> frinds=["jone","smith","breez","sam","Messi","ahmad","crew"];

  //final duplicateItems = List<String>.generate(3, (i) => "Friend # $i");
  var items = List<String>();

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(frinds);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(frinds);
      });
    }
  }

    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(mainColor),
      appBar: AppBar(
        title:  Text("Friends Page"),
        backgroundColor: Color(mainColor),
      ),
      body:Container(
         child: Column(
           children: <Widget>[

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                 onChanged: (value) {
                   filterSearchResults(value);
                 },
                 controller: editingController,
                 decoration: InputDecoration(
                     labelText: "Search",
                     hintText: "Search your frinds at gym",
                     prefixIcon: Icon(Icons.search,color: Color(primareyColor),),
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(25.0)))),
               ),
             ),
      Expanded(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("personNamePhone").snapshots(),
          builder: (context,snapshot)
          {
            if(snapshot.data == null) {
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
                      child:Icon(Icons.person),
                    ),
                    title: Text(course['name']),
                    subtitle: Text(course['phone']),
                  );
                });
          },
        ),
      ),
    ],
      ),
      )
    );
  }
}