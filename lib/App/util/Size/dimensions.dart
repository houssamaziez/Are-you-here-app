import 'package:flutter/material.dart';

class SizeApp {
  static const SizedBox sizedboxh10 = SizedBox(height: 10.0);
  static const SizedBox sizedboxh20 = SizedBox(height: 20.0);
  static const SizedBox sizedboxh25 = SizedBox(height: 25.0);
  static const SizedBox sizedboxh30 = SizedBox(height: 30.0);
  static const SizedBox sizedboxh40 = SizedBox(height: 40.0);

  static const double fontSizeExtraSmall = 10.0;
  static const double fontSizeSmall = 12.0;
  static const double fontSizeDefault = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeExtraLarge = 18.0;
  static const double fontSizeOverLarge = 24.0;
  static const double fontSizegrod = 28.0;

  static const double paddingSizeExtraSmall = 5.0;
  static const double paddingSizeSmall = 10.0;
  static const double paddingSizeDefault = 15.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSizeExtraLarge = 25.0;

  static const double radiusSmall = 5.0;
  static const double radiusDefault = 10.0;
  static const double radiusLarge = 15.0;
  static const double radiusExtraLarge = 20.0;

  static const int messageInputLength = 250;

  static double heightmobile(context, {double size = 1}) {
    return MediaQuery.of(context).size.height * size;
  }

  static double widthmobile(
    context, {
    double size = 1,
  }) {
    return MediaQuery.of(context).size.width * size;
  }

  static BorderRadius raduis(double raduis) {
    return BorderRadius.all(Radius.circular(raduis));
  }
}
