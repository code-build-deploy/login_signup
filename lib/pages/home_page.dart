

import 'package:digilocker/pages/registration_box.dart';
import 'package:flutter/material.dart';
import 'package:digilocker/services/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback,@required this.isMale})
      : super(key: key);
  bool isMale;
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }



  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return new Scaffold(
          backgroundColor:Color(0xff0f1b45),
          body:  Stack(
            children: <Widget>[
             // signout(),
              
              Positioned(
                top: height/8,
                left: width/8,
                child: registrationBox()
                ),
              Positioned(
                top: height/8-50,
                left: width/2-50,
                child: CircleAvatar(
                  backgroundImage: widget.isMale ? AssetImage('assets/vectorboy.jpg'):AssetImage('assets/vectorfemale.jpg'),
                    backgroundColor: Color(0xffefd1d1),
                    radius: 50,
                  ),
              ),  
            ],
          ),
        );
    }
    Widget signout(){
      return Container(
            
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(20),
            child: FlatButton(
              
              padding: EdgeInsets.all(20),
              color: Color(0xaac76061),
              onPressed: signOut,
              child: Text("Sign Out",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20),),
            ),
          );
    }
    


}
