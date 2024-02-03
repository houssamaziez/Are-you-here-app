import 'package:flutter/material.dart';

class GetImageUser {
  static returnimageiser({required String nameofuser}) {
    String letter = nameofuser[0].toLowerCase();
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Image.asset(
        "assets/images/alphabet/$letter.png",
        height: 60,
      ),
    );
  }
}
