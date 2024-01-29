import 'dart:convert';

import 'package:app/App/Service/Api/Bdd/utilsbdd.dart';
import 'package:app/App/Model/user.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:http/http.dart' as http;

class ApiOperation {
  Future<http.Response> register(
      {required String name,
      required String email,
      required String password}) async {
    Map<String, String> data = {
      'name': name,
      'email': email,
      'password': password
    };
    var response = await UtilsBdd.post(UrlApp.urlregister, data);
    UtilsBdd.statusCode(response);
    return response;
  }

  Future<User> getuserData(int userId) async {
    final response =
        await http.get(Uri.parse('${UrlApp.host}users/userdata/$userId'));
    UtilsBdd.statusCode(response);
    return User.fromJson(json.decode(response.body));
  }

  Future<http.Response> login(
      {required String email, required String password}) async {
    Map<String, String> data = {
      "email": email,
      "password": password,
    };
    http.Response response = await UtilsBdd.post(UrlApp.urllogin, data);
    UtilsBdd.statusCode(response);
    return response;
  }
}
