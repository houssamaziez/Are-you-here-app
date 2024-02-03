import 'package:app/App/View/Home/Screens/ScreenFavorite/screen_favorite.dart';
import 'package:app/App/View/Home/Screens/ScreenHome/screen_home.dart';
import 'package:app/App/View/Home/Screens/ScreenShopping/screen.shopping.dart';
import 'package:app/App/View/Home/Screens/ScrennSearch/screen_search.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int index = 0;
  List<Widget> screens = const [
    ScreenHome(),
    ScreenSearch(),
    ScreenFavorite(),
    ScreenShopping(),
  ];
  changeIndex(int value) {
    index = value;
    notifyListeners();
  }
}
