import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Go {
  static void to(BuildContext context, Widget secondScreen) {
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   PageRouteBuilder(
    //     pageBuilder: (context, animation, secondaryAnimation) => secondScreen,
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       const begin = Offset(1.0, 0.0);
    //       const end = Offset.zero;
    //       const curve = Curves.easeInOut;

    //       var tween =
    //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    //       var offsetAnimation = animation.drive(tween);

    //       return SlideTransition(
    //         position: offsetAnimation,
    //         child: child,
    //       );
    //     },
    //   ),
    //   (Route<dynamic> route) =>
    //       false, // Ensures all previous routes are removed
    // );

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => secondScreen, maintainState: false),
    );
  }

  static void removeAll(BuildContext context) {}

  static void push(Widget SecondScreen) {
    Get.offAll(() => SecondScreen);
  }

  static void back(Widget SecondScreen) {
    Get.off(() => SecondScreen);
  }
}
