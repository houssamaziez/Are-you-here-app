import 'package:app/App/Service/Api/Function/show_data.dart';
import 'package:app/App/View/Home/Profile/ProfileUser/screenProfile_user.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:flutter/material.dart';

import '../../util/Image/icons.dart';
import '../../util/theme/Style/styles.dart';

AppBar myAppBar(BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey) {
  return AppBar(
    leading: MyIcons.menu(() {
      _scaffoldKey.currentState?.openDrawer();
    }),
    title: const Text(
      'Home',
      style: StyleApp.title,
    ),
    centerTitle: true,
    actions: [
      InkWell(
          onTap: () => Go.to(context, const ScreenProfileUser()),
          child: returndataUserImage())
    ],
  );
}
