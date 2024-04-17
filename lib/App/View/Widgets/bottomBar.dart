import 'package:app/App/Controller/homeController.dart';
import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Welcome/inistateWelcome.dart';

class MyBottomBar extends StatelessWidget {
  MyBottomBar({
    super.key,
  });
  var admine = [
    BottomBarItem(iconData: Icons.dashboard_customize),
    BottomBarItem(iconData: Icons.people_sharp),
    BottomBarItem(iconData: Icons.notification_important),
    // BottomBarItem(iconData: Icons.person),
  ];

  var client = [
    BottomBarItem(iconData: Icons.person),
    BottomBarItem(iconData: Icons.notification_important),
    BottomBarItem(iconData: Icons.menu),
  ];
  @override
  Widget build(BuildContext context) {
    HomeController controller = Provider.of<HomeController>(context);
    return BottomBarDoubleBullet(
      color: Colors.blueAccent,
      selectedIndex: controller.index,
      items: userDataapp!.role.toString() == "admine" ? admine : client,
      onSelect: (index) {
        controller.changeIndex(index);
      },
    );
  }
}
