import 'package:appetec/views/enter_device_page.dart';
import 'package:appetec/views/login_page.dart';
import 'package:appetec/views/profile_setup_page.dart';
import 'package:appetec/views/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Appetec",
      theme: ThemeData(),
      home: LoginPage(),
    );
  }
}
