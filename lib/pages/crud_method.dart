
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class crudMedthods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(value) async {
    if (isLoggedIn()) {
      Firestore.instance.collection('details').add(value).catchError((e) {
        print(e);
      });
      //Using Transactions
      // Firestore.instance.runTransaction((Transaction crudTransaction) async {
      //   CollectionReference reference =
      //       await Firestore.instance.collection('testcrud');

      //   reference.add(carData);
      // });
    } else {
      print('You need to be logged in');
    }
  }

  getData() async {
    return await Firestore.instance.collection('details').snapshots();
  }

  updateData(newValues) {
    Firestore.instance
        .collection('details')
        .document('1')
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
  }

  deleteData() {
    Firestore.instance
        .collection('details')
        .document('1')
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}