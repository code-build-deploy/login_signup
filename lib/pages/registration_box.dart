import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digilocker/pages/crud_method.dart';
import 'package:digilocker/pages/first_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class registrationBox extends StatefulWidget {
  @override
  _registrationBoxState createState() => _registrationBoxState();
}

class _registrationBoxState extends State<registrationBox> {
    var _username;
  var _address;
  var _aadharNo;
  var _age;
   crudMedthods crudObj = new crudMedthods();
     final databaseReference = Firestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      height: height*3/4,
      width: width*3/4,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Container(
            width: width*3/5,
           
            child: Material(
            elevation: 15.0,
            shadowColor: Colors.blue,
            borderRadius: BorderRadius.circular(25.7),
            child: TextFormField(
      
                keyboardType: TextInputType.text,         
                decoration: InputDecoration(               
                  contentPadding: new EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  filled: true,
                  hintText: "Username",
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7),
                  borderSide: BorderSide(color: Colors.white,)) ,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7),
                  borderSide: BorderSide(color: Colors.white,)),
                  fillColor: Colors.white60,
                ),
                onChanged: (value){
                   this._username = value;

                },
              ),
            ),
          ),


             SizedBox(
            height: 20,
          ),   
           Container(
            width: width*3/5,
           
            child: Material(
            elevation: 15.0,
            shadowColor: Colors.blue,
            borderRadius: BorderRadius.circular(25.7),
            child: TextFormField(   

                keyboardType: TextInputType.numberWithOptions(decimal: false),           
                decoration: InputDecoration(               
                  contentPadding: new EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  filled: true,
                  
                  hintText: "Age",
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7),
                  borderSide: BorderSide(color: Colors.white,)) ,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7),
                  borderSide: BorderSide(color: Colors.white,)),

                  fillColor: Colors.white60,
                ),
                onChanged: (value){
                  
                   this._age = value;
                },
              ),
            ),
          ),

             SizedBox(
            height: 20,
          ),   

          Container(
            width: width*3/5,
           
            child: Material(
            elevation: 15.0,
            shadowColor: Colors.blue,
            borderRadius: BorderRadius.circular(25.7),
            child: TextFormField(   

                keyboardType: TextInputType.numberWithOptions(decimal: false),

                decoration: InputDecoration(               
                  contentPadding: new EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  filled: true,
                  
                  hintText: "Aadhar No.",
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7),
                  borderSide: BorderSide(color: Colors.white,)) ,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7),
                  borderSide: BorderSide(color: Colors.white,)),

                  fillColor: Colors.white60,
                ),
               onChanged: (value){
                  
                   this._aadharNo = value;

                },
              ),
            ),
          ),
             SizedBox(
            height: 20,
          ),   
          
          Container(
            width: width*3/5,
           
            child: Material(
            elevation: 15.0,
            shadowColor: Colors.blue,
            borderRadius: BorderRadius.circular(25.7),
            child: TextFormField(

              keyboardType: TextInputType.multiline,
              maxLines: 7,            
                decoration: InputDecoration(               
                  contentPadding: new EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  filled: true,
                  
                  hintText: "Address...",
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7),
                  borderSide: BorderSide(color: Colors.white,)) ,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7),
                  borderSide: BorderSide(color: Colors.white,)),

                  fillColor: Colors.white60,
                ),
               onChanged: (value){
                  
                   this._address = value;

                },
              ),
              
            ),
          ),
           Expanded(
            child: Container(
               
               alignment: Alignment.bottomRight,
               padding: EdgeInsets.all(8),
               child: FloatingActionButton(
                 child: Icon(Icons.keyboard_arrow_right,size:40,),
                 backgroundColor: Color(0xffe2a139),
                 onPressed: (){
                   createRecord();
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>firstScreen()));
                 },
               ),
              ),
           )
        ],
      ),
    );
  }


  void createRecord() async {
     FirebaseUser user=await _firebaseAuth.currentUser();
     await databaseReference.collection("details")
      .document(user.uid)
      .setData({        
        'Username': this._username,
        'Age': this._age,
        'AadharNo.': this._aadharNo,
        'Address': this._address,
      });

 }

}