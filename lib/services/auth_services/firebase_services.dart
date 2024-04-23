import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_admit/services/auth_services/user_id.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FireBaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //RealTime DataBase
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  //Firestore database
  final fireStore = FirebaseFirestore.instance.collection('users');

  Future<dynamic> login(
      BuildContext context, String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
      });
    } on SocketException {
      throw Exception('No Internet');
    } catch (e) {
      throw e.toString();
    }
  }

  Future<dynamic> signUp(BuildContext context, String email, String password,
      String username) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email, password: password.toString())
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
        // ref.child(value.user!.uid.toString()).set({
        //   'uid': value.user!.uid.toString(),
        //   'email': value.user!.email.toString(),
        //   'password': password,
        //   'username': username,
        //   'image': ''
        // });
      });
    } on SocketException {
      throw Exception('No Internet');
    } catch (e) {
      throw e.toString();
    }
  }

  // Future<dynamic> addData(BuildContext context, String picture,
  //     {required String name,
  //     required String email,
  //     required String? experience,
  //     required String phoneNumber,
  //     required List<Map<String, dynamic>> education,
  //     required List<Map<String, dynamic>> skills,
  //     required List<Map<String, dynamic>> languages}) async {
  //   var id = DateTime.now().millisecondsSinceEpoch.toString();
  //
  //   await fireStore.doc(SessionController().userId.toString()).update({
  //     id: {
  //       'name': name,
  //       'email': email,
  //       'phoneNo': phoneNumber,
  //       'experience': experience,
  //       'picture': picture,
  //       'educations': education,
  //       'skills': skills,
  //       'languages': languages,
  //     },
  //   }).then((value) {
  //     Utils.flushBarErrorMessage('Successfully added', Colors.blue, context);
  //   }).onError((error, stackTrace) {
  //     Utils.toastMessage(error.toString());
  //   });
  // }
}
