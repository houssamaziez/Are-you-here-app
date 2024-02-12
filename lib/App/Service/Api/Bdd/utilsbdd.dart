import 'dart:convert';
import 'package:app/App/Model/utilsModel/message_error.dart';
import 'package:app/App/View/Widgets/snackBar.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UtilsBdd {
  static var client = http.Client();
  static var headers = {"Content-Type": "application/json"};
  static Future<http.Response> post(Uri url, Map<String, dynamic> map) {
    return client.post(url, headers: headers, body: jsonEncode(map));
  }

  static statusCode(
      {required http.Response response,
      required BuildContext context,
      required screengo}) {
    MessageDataBase _message;
    if (response.statusCode == 200) {
      _message = MessageDataBase.fromJson(json.decode(response.body));
      snackBar(context,
          message: _message.message.toString(), color: Colors.green);
      Go.push(screengo);
    } else {
      _message = MessageDataBase.fromJson(json.decode(response.body));
      snackBar(context, message: _message.message.toString());
    }
  }
}
