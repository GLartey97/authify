import 'package:authify/pages/login_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Authify",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AnimatedLoginPage(),
    );
  }
}
