import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UtilsBdd {
  static var client = http.Client();
  static var headers = {"Content-Type": "application/json"};
  static Future<http.Response> post(Uri url, Map<String, String> map) {
    return client.post(url, headers: headers, body: jsonEncode(map));
  }

  static statusCode(response) {
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(json.decode(response.body)['data']);
      }
    } else {
      // Registration failed
      print('Registration failed');
    }
  }
}
