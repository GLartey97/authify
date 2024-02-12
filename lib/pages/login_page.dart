import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  Color primaryColor = const Color.fromRGBO(125, 191, 211, 1.0);
  Color secondaryColor = const Color.fromRGBO(169, 224, 241, 1.0);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Container: Image
            Container(
              height: deviceHeight * 0.25,
              width: deviceWidth * 0.53,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(500),
                image: const DecorationImage(
                  image: AssetImage('assets/images/main_avatar.png'),
                ),
              ),
            ),

            //Container: Textfield for email
            Container(
              width: deviceWidth * 0.70,
              child: const TextField(
                cursorColor: Colors.white,
                autocorrect: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),

            //Container: Textfield for password
            Container(
              width: deviceWidth * 0.70,
              child: const TextField(
                obscureText: true,
                cursorColor: Colors.white,
                autocorrect: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),

            //Login Button
            MaterialButton(
              minWidth: deviceWidth * 0.38,
              height: deviceHeight * 0.12,
              color: Colors.white,
              child: Text(
                "LOGIN",
                style: TextStyle(fontSize: 16, color: primaryColor),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
