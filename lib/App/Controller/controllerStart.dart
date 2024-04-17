import 'dart:convert';

import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../App/View/Home/home.dart';
import '../Model/Parent.dart';

class ControllerStart extends GetxController {
  var controllerpage = PageController(initialPage: 0);
  int index = 0;
  chngeindext(context) {
    if (index <= 1) {
      controllerpage.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      update();
      if (controllerpage.page == 2.0) {
        Go.to(context, ScreenSignin());
      }
    }
  }
}
