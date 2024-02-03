import 'package:app/App/util/Size/dimensions.dart';
import 'package:flutter/material.dart';

class StyleApp {
  static const TextStyle title = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle suptitle = TextStyle(
    fontSize: SizeApp.radiusExtraLarge,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle style1 = TextStyle(
    fontSize: SizeApp.radiusExtraLarge,
  );
  static const TextStyle styleTextbutton =
      TextStyle(color: Colors.white, fontSize: 18);
  static const TextStyle styleTextbuttonblack =
      TextStyle(color: Colors.black, fontSize: 18);
}
