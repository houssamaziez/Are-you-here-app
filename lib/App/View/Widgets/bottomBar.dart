import 'package:app/App/Controller/homeController.dart';
import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController controller = Provider.of<HomeController>(context);
    return BottomBarDoubleBullet(
      color: Colors.blueAccent,
      selectedIndex: controller.index,
      items: [
        BottomBarItem(iconData: Icons.dashboard_customize),
        BottomBarItem(iconData: Icons.people_sharp),
        BottomBarItem(iconData: Icons.notification_important),
        BottomBarItem(iconData: Icons.person),
      ],
      onSelect: (index) {
        controller.changeIndex(index);
      },
    );
  }
}
