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
    'issee': "true",
  };
  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      body: data,
    );

    return response;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

Future pushNote({
  required String notificationid,
  required String title,
  required String description,
}) async {
  final String apiUrl =
      '${UrlApp.host}note/create/user_id=${userid.read('iduser')}/notification_id=${notificationid}';
  Map<String, dynamic> data = {
    'title': title,
    'details': description,
  };
  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      body: data,
    );

    return response;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
