import 'package:flutter/material.dart';

class firstScreen extends StatefulWidget {
  @override
  _firstScreenState createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f1b45),
      body: Center(

        child: FloatingActionButton(
            child: Text("Back"),
             onPressed: (){
               Navigator.pop(context);
             },
          ),
      ),
    );
  }
}