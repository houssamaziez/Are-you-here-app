import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class Go {
  static void to(context, Widget SecondScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen),
    );
  }

  static void removeAll(BuildContext context) {}

  static void pop(context, SecondScreen) {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen),
    );
  }
}
