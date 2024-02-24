import 'package:app/App/Controller/homeController.dart';
import 'package:app/App/Controller/myappcontroller.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/Service/Api/Function/show_data.dart';
import 'package:app/App/View/Home/Profile/ProfileUser/screenProfile_user.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/Image/icons.dart';
import '../../util/theme/Style/styles.dart';

AppBar myAppBar(
  BuildContext context,
  GlobalKey<ScaffoldState> scaffoldKey,
) {
  return AppBar(
      leading: MyIcons.menu(() {
        scaffoldKey.currentState?.openDrawer();
      }),
      title: Consumer<HomeController>(
        builder: (context, myNotifier, child) {
          return Text(
            myNotifier.titlescreens[myNotifier.index],
            style: StyleApp.title,
          );
        },
      ),
      centerTitle: true,
      actions: [
        InkWell(
            onTap: () => Go.to(context, const ScreenProfileUser()),
            child: returndataUserImage(userid.read('iduser')))
      ],
      flexibleSpace: Consumer<MyAppController>(
        builder: (context, myNotifier, child) {
          return myNotifier.pingtime >= 999
              ? Container(
                  color: Colors.red,
                  height: 30,
                  child: const Center(
                    child: Text(
                      "Error Network",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Container();
        },
      ));
}
