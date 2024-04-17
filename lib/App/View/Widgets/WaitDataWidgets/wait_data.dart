import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/WaitDataWidgets/list_of_post.dart';
import 'package:app/App/util/List/listof_wilayat.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class Waitata {
  static Padding waitdata(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: DefaultTabController(
        length: list.length,
        child: Column(
          children: <Widget>[
            // ButtonsTabBar(
            //     buttonMargin: const EdgeInsets.all(6),
            //     backgroundColor: Colors.brown,
            //     unselectedBackgroundColor:
            //         const Color.fromARGB(255, 197, 197, 197),
            //     unselectedLabelStyle: const TextStyle(color: Colors.black),
            //     labelStyle: const TextStyle(
            //         color: Colors.white, fontWeight: FontWeight.bold),
            //     tabs: list.toList()),

            waitdatapost(),
          ],
        ),
      ),
    );
  }
}
