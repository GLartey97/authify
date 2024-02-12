import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  Color primaryColor = const Color.fromRGBO(125, 191, 211, 1.0);
  Color secondaryColor = const Color.fromRGBO(169, 224, 241, 1.0);

  double deviceHeight = 0;
  double deviceWidth = 0;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return const Scaffold();
  }
}
