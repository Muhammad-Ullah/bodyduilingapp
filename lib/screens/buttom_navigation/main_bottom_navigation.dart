
import 'package:gymbodybuilding/models/constants.dart';
import 'package:gymbodybuilding/screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:gymbodybuilding/screens/buttom_navigation/home_bottom.dart';
import 'package:gymbodybuilding/screens/buttom_navigation/profile_bottom.dart';
import 'package:gymbodybuilding/screens/buttom_navigation/show_bottom.dart';
import 'package:flutter/material.dart';
import 'chat_bottom.dart';
import 'contribution_bottom.dart';

class Home extends StatefulWidget with NavigationStates {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [

    HomeBottom(),
    ContributionBottom(),
    ShowBottom(),
    ChatBottom("Smith"),
    ProfileBottom(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(" ",style: TextStyle(color: Colors.black),),
      //   actions: <Widget>[
      //     new IconButton(
      //       icon: new Icon(Icons.notification_important,color: Colors.black,),
      //       onPressed: () => Navigator.of(context).pop(null),
      //     ),
      //   ],
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward,color: Color(mainColor),size: 35,),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add,color: Color(mainColor),size: 35,),
            title: Text(''),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Color(mainColor),size: 35,),
              title: Text('',style: TextStyle(color: Colors.black),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat,color: Color(mainColor),size: 35,),
              title: Text('')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Color(mainColor),size: 35,),
              title: Text('')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}