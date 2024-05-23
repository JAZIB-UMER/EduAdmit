import 'dart:async';

import 'package:edu_admit/data_model/user_model.dart';
import 'package:edu_admit/services/auth_services/user_id.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setData(String name, String email,
      {String? level = 'user'}) async {
    await _prefs.setString('name', name);
    await _prefs.setString('email', email);
    await _prefs.setString('level', level!);
  }

  UserData getData() {
    String? name = _prefs.getString('name');
    String? email = _prefs.getString('email');
    String? level = _prefs.getString('level');

    return UserData(name: name, email: email, level: level);
  }

  Future<void> clearPreferences() async {
    await _prefs.clear();
  }

  Future fetchData() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    // Assuming your data is stored under a node named 'users'
    DatabaseReference usersRef = databaseReference
        .child('User')
        .child(SessionController().userId.toString());

    try {
      DatabaseEvent snapshot = await usersRef.once();

      Map<dynamic, dynamic>? values = snapshot.snapshot.value as Map?;

      await SharedPreferencesHelper().setData(
          values!['username'].toString(), values['email'].toString(),
          level: values['level'].toString());
    } catch (error) {
      //print('Failed to fetch data for user $error');
      // Handle the error here
      Utils.toastMessage(error.toString());
    }
  }
}
