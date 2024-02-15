import 'package:authify/pages/homepage.dart';
import 'package:authify/utils/animations/login_page_animation.dart';
import 'package:flutter/material.dart';

class AnimatedLoginPage extends StatefulWidget {
  const AnimatedLoginPage({super.key});

  @override
  State<AnimatedLoginPage> createState() => _AnimatedLoginPageState();
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage(controller);
  }
}

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  late AnimationController controller;
  late EnterAnimation animation;

  LoginPage(controller, {super.key}) {
    controller = controller;
    animation = EnterAnimation(controller);
    controller.forward();
  }

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
        child: SizedBox(
          height: deviceHeight * 0.62,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Container: Image
              AnimatedBuilder(
                animation: animation.controller,
                builder: (BuildContext context, Widget? widget) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.diagonal3Values(
                        animation.circleSize.value,
                        animation.circleSize.value,
                        1),
                    child: Container(
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
                  );
                },
              ),

              //Separation
              SizedBox(
                height: deviceHeight * 0.05,
              ),

              //Container: Textfield for email
              SizedBox(
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
              SizedBox(
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

              //Separation
              SizedBox(
                height: deviceHeight * 0.1,
              ),

              //Login Button
              MaterialButton(
                minWidth: deviceWidth * 0.38,
                height: deviceHeight * 0.055,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Homepage();
                      },
                    ),
                  );
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 16, color: primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
