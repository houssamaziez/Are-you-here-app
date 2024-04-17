import 'package:flutter/material.dart';

class PresentController extends ChangeNotifier {
  String query = '';

  onChanged(value) {
    query = value;
    notifyListeners();
  }
}
