import 'package:app/App/Model/post.dart';
import 'package:app/App/View/Admine/Lavel/screenAllLavel.dart';
import 'package:app/App/View/Admine/Parents/screenParents.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../Service/Api/Function/Notification/getlengthNotification.dart';
import '../Service/Api/Function/PostFunction/getdata.dart';
import '../View/Home/Screens/Notification/screenNotification.dart';
import '../View/Home/Screens/ScreenSearch/screenSearch.dart';
import '../View/Widgets/WaitDataWidgets/list_of_post.dart';

class HomeController extends ChangeNotifier {
  int index = 0;

  String nidofcatigory = "0";
  String niclass = "";

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

  List<Widget> screens = [
    ScreenAllLavel(),
    ScreenSearch(),
    const ScreenNotification(),
    const Scaffold(),
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

  changeIndexclass(String value) {
    niclass = value;
    notifyListeners();
  }

  late List<bool> isSelected;
  initailisSelected(List<Student>? userData) {
    isSelected = List<bool>.generate(
        userData!.length, (index) => userData[index].isPresent!.toBoolean());
    notifyListeners();
  }

  changeisSelected(bool selected, ind) {
    isSelected[ind] = selected;
    notifyListeners();
  }

  Widget Mywideget = waitdatapost();
  suctodent(id_classa) {
    Mywideget = FutureBuilder(
      future:
          GetDataPost.getall_post_Catigory(wilaya: "", id_classa: id_classa),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitdatapost();
        } else if (snapshot.hasError) {
          // Show an error message if the data fetching fails
          return waitdatapost();
        } else {
          // Build your UI based on the fetched data
          List<Student>? userData = snapshot.data;
          return StudentsToggleBu(
            students: userData!,
          );
        }
      },
    );
    notifyListeners();
  }
}
