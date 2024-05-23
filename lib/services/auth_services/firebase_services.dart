import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_admit/services/auth_services/shared_pref_services.dart';
import 'package:edu_admit/services/auth_services/user_id.dart';
import 'package:edu_admit/services/notifications/notification_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //RealTime DataBase
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  //Cloud
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<dynamic> login(
      BuildContext context, String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        String token = await NotificationServices().getDeviceToken();
        storeDeviceToken(token);
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
          .then((value) async {
        SessionController().userId = value.user!.uid.toString();
        String token = await NotificationServices().getDeviceToken();
        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'password': password,
          'username': username,
          'level': 'user',
          'image': ''
        }).then((value) {
          storeDeviceToken(token);
        });
      });
    } on SocketException {
      throw Exception('No Internet');
    } catch (e) {
      throw e.toString();
    }
  }

  Future signInWithGoogle() async {
    // Sign In process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain details
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create user credentials
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //firebase
    return FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      Fluttertoast.showToast(msg: 'Successfully Signed In');
      String token = await NotificationServices().getDeviceToken();
      SessionController().userId = value.user!.uid.toString();
      ref.child(value.user!.uid.toString()).set({
        'uid': value.user!.uid.toString(),
        'email': value.user!.email.toString(),
        'password': 'google',
        'username': value.user!.displayName.toString(),
        'image': ''
      }).then((value) {
        storeDeviceToken(token);
      });
      await SharedPreferencesHelper().setData(
          value.user!.displayName.toString(), value.user!.email.toString());
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  Future<void> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();

      // Check if the user successfully signed in
      if (result.status == LoginStatus.success) {
        // Retrieve the access token
        final AccessToken accessToken = result.accessToken!;

        // Use the access token to get the user's profile data
        //final userData = await FacebookAuth.instance.getUserData();

        // Create a FacebookAuthCredential using the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);

        //firebase
        return FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential)
            .then((value) {
          Fluttertoast.showToast(msg: 'Successfully Signed In');
          SessionController().userId = value.user!.uid.toString();
          ref.child(value.user!.uid.toString()).set({
            'uid': value.user!.uid.toString(),
            'email': value.user!.email.toString(),
            'password': 'facebook',
            'username': value.user!.displayName.toString(),
            'image': ''
          });
        }).onError((error, stackTrace) {
          Fluttertoast.showToast(msg: error.toString());
        });

        // Extract the user's name and ID from the profile data
      } else {
        // Handle sign-in failure
        Fluttertoast.showToast(msg: 'Sign in failed ');
      }
    } catch (e) {
      // Handle sign-in errors
      Fluttertoast.showToast(msg: 'Sign in failed : $e ');
    }
  }

  Future<void> storeDeviceToken(String token) async {
    try {
      await firestore.collection('Tokens').doc(token).set({
        'token': token,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<String>> fetchDeviceTokens() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('Tokens').get();
      List<String> tokens = [];
      for (var doc in querySnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          var token = data['token'];
          if (token != null) {
            tokens.add(token.toString());
          }
        }
      }
      return tokens;
    } catch (e) {
      return [];
    }
  }

  Future<void> deleteDeviceToken(String token) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Tokens')
          .where('token', isEqualTo: token)
          .get();
      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
