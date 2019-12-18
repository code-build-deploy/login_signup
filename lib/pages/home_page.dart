import 'package:flutter/material.dart';
import 'package:digilocker/services/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

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
    return new Scaffold(
        
        body:  FloatingActionButton(
          onPressed: signOut,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}



