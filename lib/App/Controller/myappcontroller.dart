import 'package:app/App/Model/user.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import '../Service/Api/api_operations.dart';

class MyAppController extends ChangeNotifier {
  UserData? userdata;
  String iscreate = 'iscreate';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void updateData(UserData newData) {
    userdata = newData;
    notifyListeners();
  }

  ins() {
    if (userid.read('iduser') == null) {
    } else {
      ApiOperation.getuserData(
        int.parse(userid.read('iduser')),
      ).then((UserData value) {
        if (value.status == true) {
          updateData(value);
        } else {}
      });
    }
  }
}
