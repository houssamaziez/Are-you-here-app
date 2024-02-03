import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int index = 0;

  changeIndex(int value) {
    index = value;
    notifyListeners();
  }
}
