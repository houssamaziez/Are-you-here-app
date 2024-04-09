import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:app/App/util/Const/url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Bdd/local/auth.dart';

Future pushNotification({
  required String id,
  required String title,
  required String description,
  required String post_id,
}) async {
  final String apiUrl =
      '${UrlApp.host}Notisfication/iduser=$id/idusersend=${userid.read('iduser')}';
  Map<String, dynamic> data = {
    'title': title,
    'description': description,
    'post_id': post_id,
  };
  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      //   // Add any additional headers here
      // },
      body: data,
    );

    return response;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
