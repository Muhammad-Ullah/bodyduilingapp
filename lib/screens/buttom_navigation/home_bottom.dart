import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymbodybuilding/models/constants.dart';

class HomeBottom extends StatefulWidget {
  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 350,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Color(mainColor),
                          child: Stack(
                            children: [
                              Center(
                                  child: Icon(
                                Icons.people,
                                size: 150,
                                    color: Colors.white,
                              )),
                              Center(
                                child: Icon(
                                  Icons.person,
                                  size: 140,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Center(
                                  child: Container(
                                      margin: EdgeInsets.only(top: 250),
                                      child: Text(
                                        "Join/Make a workout Room",
                                        style: TextStyle(
                                            fontSize: 15,

                                          color: Colors.white
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 350,

                        child: Card(
                          color: Color(mainColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Stack(
                            children: [
                              Center(
                                  child: Icon(
                                Icons.people,
                                size: 150,
                                color: Colors.white,
                              )),
                              SizedBox(
                                height: 100,
                              ),
                               Container(
                                    margin: EdgeInsets.only(top: 250),
                                    child: Center(
                                      child: Text("Meet Workout Buddy",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white)),
                                    )),

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(mainColor),
                    child: Stack(
                      children: [
                        Center(
                            child: Icon(
                          Icons.person,
                          size: 120,
                              color: Colors.white,
                        )),

                        Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 120),
                              child: Text("Solo",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white))),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
