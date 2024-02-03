import 'package:flutter/material.dart';

class MyIcons {
  static const String path = "assets/images/";
  static Function menu = <Widget>(function) {
    return Padding(
      padding: const EdgeInsets.all(5.50),
      child: IconButton(
          onPressed: function,
          icon: Image.asset(
            "${path}menu.png",
            height: 20,
          )),
    );
  };
}
