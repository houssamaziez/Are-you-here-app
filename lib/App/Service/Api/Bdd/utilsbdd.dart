import 'dart:convert';
import 'package:app/App/Model/utilsModel/message_error.dart';
import 'package:app/App/util/Const/text_app.dart';
import 'package:app/App/util/Route/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UtilsBdd {
  static var client = http.Client();
  static var headers = {"Content-Type": "application/json"};
  static Future<http.Response> post(Uri url, Map<String, String> map) {
    return client.post(url, headers: headers, body: jsonEncode(map));
  }

  static statusCode(http.Response response, context) {
    MessageDataBase _message;
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(json.decode(response.body)['data']);
        RouteApp.gotHome(context);
      }
      _message = MessageDataBase.fromJson(json.decode(response.body));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_message.message.toString()),
        backgroundColor: Colors.green,
      ));
    } else {
      _message = MessageDataBase.fromJson(json.decode(response.body));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_message.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }
}
