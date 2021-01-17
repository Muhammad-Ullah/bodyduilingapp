

import 'package:cloud_firestore/cloud_firestore.dart';
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
      body:
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("personNamePhone").snapshots(),
            builder: (context,snapshot)
            {
              if(snapshot.data==null)
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context,index)
                  {
                    DocumentSnapshot course=snapshot.data.documents[index];
                    return SingleChildScrollView(
                     child: Container(
                       margin: EdgeInsets.only(left: 50),
                       child: Row(
                         children: [
                         Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: <Widget>[
                         SizedBox(
                         height: 20.0,
                       ),
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
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Username',
                                          style: TextStyle(
                                              color: Colors.blueGrey, fontSize: 18.0)),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Michelle James',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                           SizedBox(
                             height: 20.0,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               Align(
                                 alignment: Alignment.centerLeft,
                                 child: Container(
                                   child: Column(
                                     children: <Widget>[
                                       Align(
                                         alignment: Alignment.centerLeft,
                                         child: Text('Phone',
                                             style: TextStyle(
                                                 color: Colors.blueGrey, fontSize: 18.0)),
                                       ),
                                       Align(
                                         alignment: Alignment.centerLeft,
                                         child: Text('03326426126',
                                             style: TextStyle(
                                                 color: Colors.black,
                                                 fontSize: 20.0,
                                                 fontWeight: FontWeight.bold)),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           SizedBox(
                             height: 20.0,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               Align(
                                 alignment: Alignment.centerLeft,
                                 child: Container(
                                   child: Column(
                                     children: <Widget>[
                                       Align(
                                         alignment: Alignment.centerLeft,
                                         child: Text('game',
                                             style: TextStyle(
                                                 color: Colors.blueGrey, fontSize: 18.0)),
                                       ),
                                       Align(
                                         alignment: Alignment.centerLeft,
                                         child: Text('Cardio',
                                             style: TextStyle(
                                                 color: Colors.black,
                                                 fontSize: 20.0,
                                                 fontWeight: FontWeight.bold)),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                    ]
                    ),
                     ));

                  });

            },
          ),

    );
  }

}