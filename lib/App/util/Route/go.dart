import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Go {
  static void to(context, Widget SecondScreen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SecondScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.bounceIn;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  static void removeAll(BuildContext context) {}

  static void push(Widget SecondScreen) {
    Get.offAll(() => SecondScreen);
  }
}
