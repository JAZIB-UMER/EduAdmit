import 'dart:async';

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

  Future<void> setData(String name) async {
    await _prefs.setString('name', name);
  }

  UserData getData() {
    String? name = _prefs.getString('name');

    return UserData(name: name);
  }

  Future<void> clearPreferences() async {
    await _prefs.clear();
  }

  // Future fetchData() async {
  //   DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  //
  //   // Assuming your data is stored under a node named 'users'
  //   DatabaseReference usersRef = databaseReference
  //       .child('User')
  //       .child(SessionController().userId.toString());
  //
  //   try {
  //     DatabaseEvent snapshot = await usersRef.once();
  //
  //     Map<dynamic, dynamic>? values = snapshot.snapshot.value as Map?;
  //
  //     //  debugPrint(snapshot.snapshot.value.toString());
  //
  //     SharedPreferencesHelper()
  //         .setData(values!['username'].toString(), values['email'].toString());
  //   } catch (error) {
  //     //print('Failed to fetch data for user $error');
  //     // Handle the error here
  //   }
  // }
}

class UserData {
  final String? name;

  UserData({this.name});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['username'],
    );
  }
}
