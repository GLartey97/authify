import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget child;

  SlidePageRoute(this.child)
      : super(
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, Animation animation,
              Animation secondaryAnimation, child) {
            animation = Tween<Offset>(
              begin: const Offset(-1, 0),
              end: const Offset(0, 0),
            ).animate(animation as Animation<double>);
            return SlideTransition(
              position: animation as Animation<Offset>,
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return child;
          },
        );
}
