
import 'dart:ffi';

import 'package:digilocker/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digilocker/services/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class chooseGender extends StatefulWidget {
    chooseGender({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _chooseGenderState createState() => _chooseGenderState();
}

class _chooseGenderState extends State<chooseGender> {

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   bool _ismale;
    @override
   void initState() {
   _ismale= null;

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
    return  Scaffold(
           backgroundColor: Color(0xff0f1b45),  
           body: genders(width, height),
       
       
       );
    
  }
 
  
   Widget genders(width,height){
    return Container(
    padding: EdgeInsets.only(top: height/5),
     child: Column(
        
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text('Hi,',style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                 SizedBox(height: 5,),
                  Text('Select your gender',style: TextStyle(color: Colors.white,fontSize: 20),)
              ],
            ),
          ),

          SizedBox(height: height/10,),

          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


          Container(
            child: FlatButton(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/vectorboy.jpg',),
                    backgroundColor: Color(0xffe2a139),
                    
                  ),
                   SizedBox(height: 7,),
                  Text('Male',style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
              onPressed: (){
                setState(() {
                  _ismale = true;
                });
                print(_ismale);
              }
                
              
            ),
          ),

          Container(
            child: FlatButton(   
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/vectorfemale.jpg',),
                    backgroundColor: Color(0xffe2a139),
                  ),
                  SizedBox(height: 7,),
                  Text('Female',style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
              onPressed: (){
                setState(() {
                  _ismale = false;
                });
                print(_ismale);
              }
                
              
            ),
          ),
            ],
          ),

          Padding(
           padding: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
           child: SizedBox(
           height: 40.0,
           width: width*2/3,
           child: new RaisedButton(
            child: Text("REGISTER",style: TextStyle(fontSize: 20,color: Colors.white),),
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Color(0xffe2a139),
            onPressed: (){
              if(_ismale!=null){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage( userId: widget.userId,
                auth: widget.auth,
                logoutCallback: widget.logoutCallback,
                isMale: _ismale,
                )));
              }
            },  
          )
         )
        ),      
        ],
      ),
    );
  }


}
