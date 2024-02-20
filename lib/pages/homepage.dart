import 'package:authify/utils/animations/login_page_animation.dart';
import 'package:flutter/material.dart';

class AnimatedHomePage extends StatefulWidget {
  const AnimatedHomePage({super.key});

  @override
  State<AnimatedHomePage> createState() => _AnimatedHomePageState();
}

class _AnimatedHomePageState extends State<AnimatedHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
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
    return Homepage(controller);
  }
}

// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  late AnimationController controller;
  late EnterAnimation animation;

  Homepage(this.controller, {super.key}) {
    animation = EnterAnimation(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = const Color.fromRGBO(169, 224, 241, 1.0);

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: deviceHeight * 0.62,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Container: Avatar Image
              AnimatedBuilder(
                  animation: animation.controller,
                  builder: (context, widget) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.diagonal3Values(
                        animation.circleSize.value,
                        animation.circleSize.value,
                        1,
                      ),
                      child: Container(
                        height: deviceHeight * 0.25,
                        width: deviceWidth * 0.53,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(500),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/main_avatar.png"),
                          ),
                        ),
                      ),
                    );
                  }),

              //separation
              SizedBox(
                height: deviceHeight * 0.03,
              ),

              //Name Widget
              Text(
                "GIZER",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                ),
              ),

              //separation
              SizedBox(
                height: deviceHeight * 0.20,
              ),

              //Logout Button
              MaterialButton(
                minWidth: deviceWidth * 0.38,
                height: deviceHeight * 0.055,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(
                    color: primaryColor,
                    width: 3,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "LOGOUT",
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
