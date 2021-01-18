import 'package:gymbodybuilding/screens/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';

class Notify extends StatefulWidget with NavigationStates{
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text("Notifications",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/lock.png"),
            ),
            title: Text("Brainhdaures",style: TextStyle(color: Colors.black,fontSize: 20),),
            subtitle: Text("Latest Update Logitech Ipad product review by Ashley",style: TextStyle(color: Colors.black54),),
            trailing: Text("Time"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/lock.png"),
            ),
            title: Text("Brainhdaures",style: TextStyle(color: Colors.black,fontSize: 20),),
            subtitle: Text("Latest Update Logitech Ipad product review by Ashley",style: TextStyle(color: Colors.black54),),
            trailing: Text("Time"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/lock.png"),
            ),
            title: Text("Brainhdaures",style: TextStyle(color: Colors.black,fontSize: 20),),
            subtitle: Text("Latest Update Logitech Ipad product review by Ashley",style: TextStyle(color: Colors.black54),),
            trailing: Text("Time"),
          ),
        ],
      ),
    );
  }
}
