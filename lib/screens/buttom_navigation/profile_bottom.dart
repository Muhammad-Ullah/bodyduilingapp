import 'package:flutter/material.dart';
import 'package:gymbodybuilding/models/constants.dart';

//import '../constant.dart';


class ProfileBottom extends StatefulWidget {
  @override
  _ProfileBottomState createState() => _ProfileBottomState();
}

class _ProfileBottomState extends State<ProfileBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 50,0, 0),
                  width: 10,
                  height: 10,
                  decoration:
                  ShapeDecoration(shape: CircleBorder(), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: ClipOval(
                      child: new SizedBox(
                        width: 180.0,
                        height: 180.0,
                        child: Image.asset('images/lock.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Text("Donna C. Calery",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
              ),
              Center(
                child: Container(
                  child: Text("+92335 19 96724",style: TextStyle(fontSize: 15,color: Colors.black54),),
                ),

              ),

              Container(
                  margin: EdgeInsets.only(left: 0,right: 0,top: 30),
                  height: 50,
                  child: Center(
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: '  Full Name',
                        suffixIcon: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
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
                  margin: EdgeInsets.only(left: 0,right: 0,top: 10),
                  height: 50,
                  child: Center(
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: '  Phone No',
                        suffixIcon: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
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
                  margin: EdgeInsets.only(left: 0,right: 0,top: 10),
                  height: 50,
                  child: Center(
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: '  nasiruetian.pk@gmail.com',
                        suffixIcon: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
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
                  margin: EdgeInsets.only(left: 0,right: 0,top: 10),
                  height: 50,
                  child: Center(
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: '  20 / 03 / 1999',
                        suffixIcon: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
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
                  margin: EdgeInsets.only(left: 0,right: 0,top: 10),
                  height: 50,
                  child: Center(
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: '  *********',
                        suffixIcon: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
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
                color: Colors.transparent,
                margin: EdgeInsets.only(left: 20,right: 20),
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(0.0),
                  ),
                  onPressed: () {
                    showcontent();
                  },
                  color: Color(mainColor),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  void showcontent() {

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(

            title: Text('Logout'),
            content: const Text(
              'Are you sure do you want to logout',style: TextStyle(color: Colors.grey),),
            actions: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    FlatButton(
                      child: const Text('ACCEPT',style: TextStyle(color: Colors.red),),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: const Text('CANCLE',),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],

                ),
              ),

            ],
          );
        });
  }
}
