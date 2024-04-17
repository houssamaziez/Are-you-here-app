import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/Parent.dart';
import '../util/Const/url.dart';
import 'package:http/http.dart' as http;

class PresentController extends ChangeNotifier {
  String query = '';

  onChanged(value) {
    query = value;
    notifyListeners();
  }

  Parent? parents;
}
