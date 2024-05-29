import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:edu_admit/services/auth_services/firebase_services.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:http/http.dart' as http;
import 'package:edu_admit/views/main_screens/main_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:fluttertoast/fluttertoast.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payLoad) {
      handleMessage(context, message);
    });
  }

  void fireBaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotifications(message);
      } else {
        showNotifications(message);
      }
      // debugPrint(message.notification!.title.toString());
      // debugPrint(message.notification!.body.toString());
    });
  }

  Future<void> showNotifications(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        'High Importance Notifications ',
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'Your Channel Description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      Fluttertoast.showToast(msg: 'User Granted Provisional Permission');
    } else {
      Fluttertoast.showToast(msg: 'User Denied');
    }
  }

  // For Device Token
  // Firebase sends notifications on specific device tokens
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    // When App is Terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    // When App is in Background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, initialMessage!);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'newMessage') {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const MainScreen()));
    }
  }

  Future<void> sendNotificationToAll(String title, String body) async {
    const String serverKey =
        'AAAAJvuhurg:APA91bGHT9px6LVUzIu74vxOZPLTGMXUAoQtdNqbUWVln6sOsi4hWt0_Lt5oxMy5OId-EEKEpZhtEEhgtjIi0Hh15NfCQdymiMLhsMdgd9RNemBagV22B8W0F-TYHGvPp4AU8YbM4Umb';
    const String fcmUrl = 'https://fcm.googleapis.com/fcm/send';

    final Map<String, dynamic> notification = {
      'title': title,
      'body': body,
    };

    // Fetch device tokens
    List<String> tokens = await FireBaseServices().fetchDeviceTokens();

    for (var token in tokens) {
      final Map<String, dynamic> data = {
        'notification': notification,
        'to': token,
        'priority': 'high',
        'data': {
          'type': 'newMessage',
        }
      };

      final headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'key=$serverKey',
      };

      try {
        final response = await http.post(Uri.parse(fcmUrl),
            headers: headers, body: jsonEncode(data));
        if (response.statusCode == 200) {
        } else {
          Utils.toastMessage('Error occurred');
        }
      } catch (e) {
        throw e.toString();
      }
    }
  }
}
