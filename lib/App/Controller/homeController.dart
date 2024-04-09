import 'package:app/App/View/Home/Screens/ScreenFavorite/screen_favorite.dart';
import 'package:app/App/View/Home/Screens/ScreenHome/screen_home.dart';
import 'package:app/App/View/Home/Screens/ScreenSearch/screenSearch.dart';
import 'package:app/App/View/Home/Screens/ScreenShopping/screen.shopping.dart';
import 'package:flutter/material.dart';

import '../Service/Api/Function/Notification/getlengthNotification.dart';

class HomeController extends ChangeNotifier {
  int index = 0;

  String nidofcatigory = "1";

  String langthnotification = '0';
  updatelegth() async {
    getlengthNotification().then((value) {
      langthnotification = value;
      notifyListeners();
    });
  }

  removelegth() async {
    removelangth().then((value) {
      langthnotification = value;
      notifyListeners();
    });
  }

  List<Widget> screens = const [
    ScreenHome(),
    ScreenSearch(),
    ScreenFavorite(),
    ScreenShopping(),
  ];
  List<String> titlescreens = const [
    'Screen Home',
    'Screen Search',
    'Screen Favorite',
    'Screen Shopping',
  ];
  changeIndex(int value) {
    index = value;
    notifyListeners();
  }

  changeIndexcatigory(String value) {
    nidofcatigory = value;
    notifyListeners();
  }
}
