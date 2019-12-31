import 'dart:convert';

import 'package:digilocker/pages/certificate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digilocker/services/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

import 'certificate.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback, this.email})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  final String email;

  @override
  State<StatefulWidget> createState() => new _HomePageState(email: email);
}

class _HomePageState extends State<HomePage> {

  _HomePageState({this.email});

  final String email;

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

  var certificatesData;

  getMerits () async{
    var url = 'http://192.168.0.110:8000/display/';
    Map data = {
      "email": email
    };
    var jsonData = json.encode(data);
    http.post(url, body: jsonData).then((response){
      var t = response.body;
      var jsonResult = json.decode(t);
      setState(() {
        certificatesData = jsonResult["certificates"];
      });
      return jsonResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 96,
            ),
            Text(
              "Your Certificates",
              style: TextStyle(
                fontSize: 24
              )
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: StreamBuilder(
                stream: getMerits().asStream(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(certificatesData != null){
                    if(certificatesData.length == 0){
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 24
                        ),
                        child: Text(
                          "Ask the organisation to issue a certificate with your details",
                          style: TextStyle(
                            fontSize: 23
                          ),
                        ),
                      );
                    }
                    else{
                      return ListView.builder(
                        itemCount: certificatesData.length,
                        itemBuilder: (BuildContext context, int index){
                          return InkWell(
                            onTap: (){},
                            child: ListTile(
                              title: Text(
                                certificatesData[index]['title']
                              ),
                              subtitle: Text(
                                certificatesData[index]['reciever']
                              ),
                              leading: Icon(
                                Icons.assignment
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }
                  else{
                    return Text('');
                  }
                },
              ),
            ),
            SizedBox(
              height: 64,
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: (){
              signOut();
            },
            heroTag: 'logout',
            child: Icon(Icons.power_settings_new),
          ),
          SizedBox(
            height: 32,
          ),
          FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.camera_alt),
          )
        ],
      )
    );
  }
}



