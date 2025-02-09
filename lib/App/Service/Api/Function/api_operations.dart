// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:app/App/Controller/myappcontroller.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/Service/Api/Bdd/utilsbdd.dart';
import 'package:app/App/Model/user.dart';
import 'package:app/App/Service/Api/Function/Put/user.dart';
import 'package:app/App/View/Auth/Forgot%20Password/screenchange_ps.dart';
import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/View/Home/home.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:app/App/util/math.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../View/Welcome/inistateWelcome.dart';

class ApiOperation extends ChangeNotifier {
  bool isloadingAuth = false;
  change(bool vule) {
    isloadingAuth = vule;
    notifyListeners();
  }

  Future register(
      {required String name,
      required String email,
      required String wilaya,
      required int phone,
      required String password,
      required BuildContext context}) async {
    isloadingAuth = true;
    notifyListeners();
    Map<String, dynamic> data = {
      'name': name,
      'email': email,
      "address": wilaya.toString(),
      "phone": phone.toInt(),
      'password': password,
      'tokennotification': "null",
    };
    try {
      var response = await UtilsBdd.post(UrlApp.urlregister, data);

      UtilsBdd.statusCode(
          response: response, context: context, screengo: const Home());
      UserData userdata = UserData.fromJson(json.decode(response.body));
      await ApiPut.updatatoken(userdata.user!.id.toString());

      isloadingAuth = false;
      notifyListeners();
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<UserData> getuserData(
    int userId,
  ) async {
    final response =
        await http.get(Uri.parse('${UrlApp.host}users/userdata/$userId'));
    return UserData.fromJson(json.decode(response.body));
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
      UserData userdata = UserData.fromJson(json.decode(response.body));
      UtilsBdd.statusCode(
          response: response, context: context, screengo: const Home());
      await ApiPut.updatatoken(userdata.user!.id.toString());
      userid
          .write("iduser", userdata.user!.id.toString())
          .then((value) => null);
      userwilaya
          .write("wilaya", userdata.user!.wilaya.toString())
          .then((value) => null);
      final myData = MyAppController();

      UserData user = await ApiOperation.getuserData(
        int.parse(userid.read('iduser')),
      );
      myData.updateData(user);
      ApiPut.getuserData(userid.read('iduser')).then((value) {
        userDataapp = value;
        Go.push(Home());
      });
      print(myData.userdata!.user!.name);
      return response;
    } catch (e) {}
  }

  @override
  void dispose() {
    isloadingAuth = false;
    notifyListeners();
    super.dispose();
  }

  Future sendEmailConferM(
      {required String email, required BuildContext context}) async {
    final String code = LogiqueMath.generateRandomNumber().toString();
    Map<String, String> data = {
      'mail': email,
      'id': code,
    };
    try {
      var response = await UtilsBdd.post(UrlApp.urlsendmail, data);
      Go.push(ScreenChangePassword(
        code: code,
        email: email,
      ));
      await UtilsBdd.statusCode(
          response: response,
          context: context,
          screengo: ScreenChangePassword(
            code: code,
            email: email,
          ));

      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future updatepassword(
      {required String password,
      required String email,
      required BuildContext context}) async {
    Map<String, String> data = {
      'email': email,
      'password': password,
    };
    try {
      var response = await UtilsBdd.post(UrlApp.urleditUserPassword, data);
      UtilsBdd.statusCode(
          response: response, context: context, screengo: const ScreenSignin());
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
