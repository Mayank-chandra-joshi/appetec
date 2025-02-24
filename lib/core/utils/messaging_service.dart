import 'dart:io';

import 'package:appetec/core/constants/backend/url.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MessagingService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init() async {
    await _fcm.requestPermission();

    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings =
        InitializationSettings(android: androidInitSettings);

    await flutterLocalNotificationsPlugin.initialize(initSettings);

    // Get FCM token (for backend integration)
    FirebaseMessaging.instance.getToken().then((token) async {
      print(token);
      // final storage = FlutterSecureStorage();
      // String? authToken = await storage.read(key: 'accessToken');

      // final dio = Dio();

      // await dio.post(
      //   "${BackendURL.url}/api/pushtoken",
      //   data: {
      //     "pushToken": token,
      //     "deviceDetails": {},
      //     "deviceName": await getDeviceName(),
      //   },
      //   options: Options(
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'Authorization': 'Bearer $authToken',
      //     },
      //   ),
      // );
    });

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });

    // Handle notification taps when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessageNavigation(message);
    });

    // Handle background messages (app killed)
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await MessagingService().showNotification(message);
  }

  Future<void> showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'appetec_channel',
      'appetec_notificaion',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      platformDetails,
    );
  }

  void _handleMessageNavigation(RemoteMessage message) {
    // Add navigation logic when user taps the notification
    print("Navigate to specific screen based on message data.");
  }

  Future<String> getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model; // Device name
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine; // Device name
    }

    return "Unknown Device";
  }
}
