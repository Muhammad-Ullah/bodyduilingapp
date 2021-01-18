import 'package:gymbodybuilding/models/constants.dart';
import 'package:gymbodybuilding/screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';

//import '../constant.dart';


class ContactUS extends StatefulWidget with NavigationStates {
  @override
  _ContactUSState createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("      Contact us",style: TextStyle(color: Colors.black),),
        // actions: <Widget>[
        //   new IconButton(
        //     icon: new Icon(Icons.arrow_back,color: Colors.black,),
        //     onPressed: () => Navigator.of(context).pop(null),
        //   ),
        // ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.only(top: 50),
              decoration:
              ShapeDecoration(shape: CircleBorder(), color: Colors.black),
              child: Padding(
                padding: EdgeInsets.all(0),
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: CircleBorder(),
                    // image:DecorationImage(
                    //   image: AssetImage(
                    //       'images/person.png'),
                    //   fit: BoxFit.fill,
                    // ),
                    // image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     image: NetworkImage(
                    //       'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                    //     ))
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                height: 50,
                child: Center(
                  child: TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Subject Title',
                      //prefixIcon: Icon(Icons.person_outline,color: Color(redColor),),
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
                margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                height: 100,
                child: Center(
                  child: TextFormField(
                    autocorrect: true,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Enter Your message',
                      //prefixIcon: Icon(Icons.person_outline,color: Color(redColor),),
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
            
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                color: Colors.transparent,

                width: MediaQuery.of(context).size.width,
                height: 45,
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    //Navigator.pushReplacement(context,
                     //   MaterialPageRoute(builder: (context) => SideBarLayout()));
                  },
                  color: Colors.red,
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
