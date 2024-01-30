// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:app/App/Model/utilsModel/message_error.dart';
import 'package:app/App/Service/Api/Bdd/utilsbdd.dart';
import 'package:app/App/Model/user.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiOperation extends ChangeNotifier {
  bool isloadingAuth = false;
  change(bool vule) {
    isloadingAuth = vule;
    notifyListeners();
  }

  Future register(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    isloadingAuth = true;
    notifyListeners();
    Map<String, String> data = {
      'name': name,
      'email': email,
      'password': password,
    };
    try {
      var response = await UtilsBdd.post(UrlApp.urlregister, data);
      UtilsBdd.statusCode(response, context);
      isloadingAuth = false;
      notifyListeners();
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<User> getuserData(int userId, {required BuildContext context}) async {
    final response =
        await http.get(Uri.parse('${UrlApp.host}users/userdata/$userId'));
    // ignore: use_build_context_synchronously
    UtilsBdd.statusCode(response, context);
    return User.fromJson(json.decode(response.body));
  }

  Future login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    Map<String, String> data = {
      "email": email,
      "password": password,
    };
    http.Response response;
    try {
      response = await UtilsBdd.post(UrlApp.urllogin, data);
      print(response.body);

      UtilsBdd.statusCode(response, context);

      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
