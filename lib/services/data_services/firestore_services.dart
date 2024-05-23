import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:edu_admit/utils/utilities.dart';
import 'package:flutter/material.dart';

class FireStoreServices {
  //FireStore database for University
  final fireStore = FirebaseFirestore.instance.collection('Universities');

  //FireStore database for Hostel
  final fireStore2 = FirebaseFirestore.instance.collection('Scholarships');
  Future<dynamic> addUniData(dynamic data, BuildContext context) async {
    //var id = DateTime.now().millisecondsSinceEpoch.toString();

    await fireStore.doc(data.name).set(data.toJson()).then((value) {
      Utils.flushBarErrorMessage('Successfully added', Colors.blue, context);
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }

  Future<dynamic> addScholarshipData(
      dynamic data, String id, BuildContext context) async {
    await fireStore2.doc(id).set(data.toJson()).then((value) {
      Utils.flushBarErrorMessage('Successfully added', Colors.blue, context);
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }

  void deleteScholarship(var id, BuildContext context) async {
    await fireStore2.doc(id).delete().then((value) {
      Utils.flushBarErrorMessage(
          'Successfully Deleted', Colors.redAccent, context);
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), Colors.redAccent, context);
    });
  }

  Future<dynamic> updateAdmission(
      bool value, String uniName, BuildContext context) async {
    await fireStore.doc(uniName).update({'admission': value}).then((value) {
      Utils.flushBarErrorMessage('Successfully Updated', Colors.green, context);
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}
