import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Go {
  static void to(context, Widget SecondScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen),
    );
  }

  static void removeAll(BuildContext context) {}

  static void push(Widget SecondScreen) {
    Get.offAll(() => SecondScreen);
  }
}
