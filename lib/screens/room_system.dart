import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymbodybuilding/models/constants.dart';
import 'package:gymbodybuilding/screens/create_room.dart';
import 'package:gymbodybuilding/screens/your_profle.dart';
import 'already_created_room.dart';


class RoomSystem extends StatefulWidget {
  @override
  _RoomSystemState createState() => _RoomSystemState();
}

class _RoomSystemState extends State<RoomSystem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Room system"),
          backgroundColor: Color(mainColor),
        ),
        drawer: Drawer(
            child: MainDrawer(),
        ),
        body:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  child: Text("Which exercise you want to join?",style: TextStyle(fontSize: 20,color: Colors.black),),
                ),


                Container(
                  child: GridView.count(
                    crossAxisCount: 2,
                      shrinkWrap: true,
                      primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(mainColor),
                            borderRadius: BorderRadius.all(Radius.circular(15)),

                          ),
                          padding: EdgeInsets.all(20),

                          child: Center(
                            child: Text(
                              "Cardio",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: ()
                        {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AlreadyCreatedRooms()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(mainColor),
                            borderRadius: BorderRadius.all(Radius.circular(15)),

                          ),
                          padding: EdgeInsets.all(20),

                          child: Center(
                            child: Text(
                              "Weight Lose",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: ()
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CreateRoom()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(mainColor),
                            borderRadius: BorderRadius.all(Radius.circular(15)),

                          ),
                          padding: EdgeInsets.all(20),

                          child: Center(
                            child: Text(
                              "Weight Gain",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: ()
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AlreadyCreatedRooms()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(mainColor),
                            borderRadius: BorderRadius.all(Radius.circular(15)),

                          ),
                          padding: EdgeInsets.all(20),

                          child: Center(
                            child: Text(
                              "Muscles Mass",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: ()
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AlreadyCreatedRooms()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(mainColor),
                            borderRadius: BorderRadius.all(Radius.circular(15)),

                          ),
                          padding: EdgeInsets.all(20),

                          child: Center(
                            child: Text(
                              "Shoulder Press",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: ()
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AlreadyCreatedRooms()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(mainColor),
                            borderRadius: BorderRadius.all(Radius.circular(15)),

                          ),
                          padding: EdgeInsets.all(20),

                          child: Center(
                            child: Text(
                              "Push Ups",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: ()
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AlreadyCreatedRooms()));
                        },
                      ),
                    ],

                  ),
                )
              ],
            ),
          ),

        )
    );
  }
}
class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: 5.0,
              ),
              Text(
                "Lee Wang",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Software Engineer",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfilePage()));
        },
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("Your Profile"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.inbox,
          color: Colors.black,
        ),
        title: Text("Your Inbox"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.assessment,
          color: Colors.black,
        ),
        title: Text("Your Dashboard"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: Text("Settings"),
      ),
    ]);
  }
}