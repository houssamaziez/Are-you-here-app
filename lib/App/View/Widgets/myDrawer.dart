import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/Service/Api/Function/show_data.dart';
import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/View/Home/Profile/ProfileUser/screenProfile_user.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:flutter/material.dart';

Drawer myDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: InkWell(
              onTap: () => Go.to(context, const ScreenProfileUser()),
              child: returndataUserImage(userid.read('iduser'))),
        ),
        InkWell(
            onTap: () async {
              await userid
                  .write('iduser', null)
                  .then((value) => Go.push(ScreenSignin()));
            },
            child: ListTile(
              title: Text("Logout "),
            ))
      ],
    ),
  );
}
