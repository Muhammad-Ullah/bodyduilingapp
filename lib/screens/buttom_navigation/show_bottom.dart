import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymbodybuilding/models/constants.dart';

import 'main_bottom_navigation.dart';


class ShowBottom extends StatefulWidget {
  @override
  _ShowBottomState createState() => _ShowBottomState();
}

class _ShowBottomState extends State<ShowBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [


              Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  primary: true,
                  childAspectRatio:125/100,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [

                    InkWell(
                      child: Container(

                        decoration: BoxDecoration(
                          color: Color(mainColor),

                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Color(mainColor)),

                        ),
                        // padding: EdgeInsets.all(5),

                        child: Center(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child:Icon(Icons.zoom_in,size: 25,color: Colors.white,),
                                ),
                                Icon(Icons.person,size: 75,color: Colors.white,),
                                Container(
                                  child: Text("Ben Parker",style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            )
                        ),

                      ),
                      onTap: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                    InkWell(
                      child: Container(

                        decoration: BoxDecoration(
                          color: Color(mainColor),

                          borderRadius: BorderRadius.all(Radius.circular(10),),
                          border: Border.all(color: Color(mainColor)),

                        ),
                        // padding: EdgeInsets.all(5),

                        child: Center(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child:Icon(Icons.zoom_in,size: 25,color: Colors.white,),
                                ),
                                Icon(Icons.person,size: 75,color: Colors.white,),
                                Container(
                                  child: Text("azar ali",style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            )
                        ),

                      ),
                      onTap: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                    InkWell(
                      child: Container(

                        decoration: BoxDecoration(
                          color: Color(mainColor),

                          borderRadius: BorderRadius.all (Radius.circular(10)),
                          border: Border.all(color: Color(mainColor)),

                        ),
                        // padding: EdgeInsets.all(5),

                        child: Center(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child:Icon(Icons.zoom_in,size: 25,color: Colors.white,),
                                ),
                                Icon(Icons.person,size: 75,color: Colors.white,),
                                Container(
                                  child: Text("Brat lee",style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            )
                        ),

                      ),
                      onTap: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                    InkWell(
                      child: Container(

                        decoration: BoxDecoration(
                          color: Color(mainColor),

                          borderRadius: BorderRadius.all (Radius.circular(10)),
                          border: Border.all(color: Color(mainColor)),

                        ),
                        // padding: EdgeInsets.all(5),

                        child: Center(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child:Icon(Icons.zoom_in,size: 25,color: Colors.white,),
                                ),
                                Icon(Icons.person,size: 75,color: Colors.white,),
                                Container(
                                  child: Text("Chris",style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            )
                        ),

                      ),
                      onTap: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                    InkWell(
                      child: Container(

                        decoration: BoxDecoration(
                          color: Color(mainColor),

                          borderRadius: BorderRadius.all (Radius.circular(10)),
                          border: Border.all(color:Color(mainColor),),

                        ),
                        // padding: EdgeInsets.all(5),

                        child: Center(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child:Icon(Icons.zoom_in,size: 25,color: Colors.white,),
                                ),
                                Icon(Icons.person,size: 75,color: Colors.white,),
                                Container(
                                  child: Text("Crew",style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            )
                        ),

                      ),
                      onTap: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                    InkWell(
                      child: Container(

                        decoration: BoxDecoration(
                          color: Color(mainColor),

                          borderRadius: BorderRadius.all (Radius.circular(10)),
                          border: Border.all(color: Color(mainColor),),

                        ),
                        // padding: EdgeInsets.all(5),

                        child: Center(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child:Icon(Icons.zoom_in,size: 25,color: Colors.white,),
                                ),
                                Icon(Icons.person,size: 75,color: Colors.white,),
                                Container(
                                  child: Text("Chad",style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            )
                        ),

                      ),
                      onTap: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                    InkWell(
                      child: Container(

                        decoration: BoxDecoration(
                          color: Color(mainColor),

                          borderRadius: BorderRadius.all (Radius.circular(10)),
                          border: Border.all(color: Color(mainColor)),

                        ),
                        // padding: EdgeInsets.all(5),

                        child: Center(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child:Icon(Icons.zoom_in,size: 25,color: Colors.white,),
                                ),
                                Icon(Icons.person,size: 75,color: Colors.white,),
                                Container(
                                  child: Text("Jon ",style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            )
                        ),

                      ),
                      onTap: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                    InkWell(
                      child: Container(

                        decoration: BoxDecoration(
                          color: Color(mainColor),

                          borderRadius: BorderRadius.all (Radius.circular(10)),
                          border: Border.all(color: Color(mainColor),),

                        ),
                        // padding: EdgeInsets.all(5),

                        child: Center(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child:Icon(Icons.zoom_in,size: 25,color: Colors.white,),
                                ),
                                Icon(Icons.person,size: 75,color: Colors.white,),
                                Container(
                                  child: Text("Steven Smith",style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            )
                        ),

                      ),
                      onTap: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                    // InkWell(
                    //   child: Container(
                    //
                    //     decoration: BoxDecoration(
                    //       color: Color(mainColor),
                    //
                    //       borderRadius: BorderRadius.only(topRight: Radius.circular(0),),
                    //       border: Border.all(color: Colors.lightBlue),
                    //
                    //     ),
                    //     // padding: EdgeInsets.all(5),
                    //
                    //     child: Center(
                    //         child: Column(
                    //           // crossAxisAlignment: CrossAxisAlignment.center,
                    //           // mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Align(
                    //               alignment: Alignment.topRight,
                    //               child:Icon(Icons.zoom_in,size: 30,color: Colors.grey,),
                    //             ),
                    //             Icon(Icons.person,size: 100,color: Colors.grey,),
                    //             Container(
                    //               child: Text("Ben Parker"),
                    //             ),
                    //           ],
                    //         )
                    //     ),
                    //
                    //   ),
                    //   onTap: ()
                    //   {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => Home()));
                    //   },
                    // ),
                    // InkWell(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Color(mainColor),
                    //       borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    //       border: Border.all(color: Colors.lightBlue),
                    //
                    //     ),
                    //    // padding: EdgeInsets.all(5),
                    //
                    //     child: Center(
                    //       child: Column(
                    //         // crossAxisAlignment: CrossAxisAlignment.center,
                    //         // mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Align(
                    //             alignment: Alignment.topRight,
                    //             child:Icon(Icons.zoom_in,size: 30,color: Colors.grey,),
                    //           ),
                    //           Icon(Icons.person,size: 100,color: Colors.grey,),
                    //           Container(
                    //             child: Text("Ben Parker"),
                    //           ),
                    //         ],
                    //       )
                    //     ),
                    //
                    //   ),
                    //   onTap: ()
                    //   {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => Home()));
                    //   },
                    // ),

                  ],

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
