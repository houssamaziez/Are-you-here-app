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
      color: Colors.brown,
      selectedIndex: controller.index,
      items: [
        BottomBarItem(iconData: Icons.home),
        BottomBarItem(iconData: Icons.search),
        BottomBarItem(iconData: Icons.favorite),
        BottomBarItem(iconData: Icons.shopping_bag_rounded),
      ],
      onSelect: (index) {
        controller.changeIndex(index);
      },
    );
  }
}
