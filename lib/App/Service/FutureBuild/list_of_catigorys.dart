// ignore_for_file: sort_child_properties_last

import 'package:app/App/Controller/locationController.dart';
import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Model/post.dart';
import 'package:app/App/Service/Api/Function/Get/getdata.dart';
import 'package:app/App/Service/Api/Function/Notification/push.dart';
import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
import 'package:app/App/Service/FutureBuild/list_of_post_user.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/WaitDataWidgets/list_of_post.dart';
import 'package:app/App/View/Widgets/WaitDataWidgets/wait_data.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../../Model/classa.dart';
import '../../View/Widgets/snackBar.dart';
import '../../util/Const/url.dart';
import '../../util/Size/dimensions.dart';
import '../Api/Function/Notification/put.dart';
import '../ImageCach/imagecach.dart';

class ListOfCatigorys extends StatefulWidget {
  const ListOfCatigorys({super.key});

  @override
  State<ListOfCatigorys> createState() => _ListOfCatigorysState();
}

class _ListOfCatigorysState extends State<ListOfCatigorys> {
  late HomeController controllerHome;
  @override
  void initState() {
    controllerHome = Provider.of<HomeController>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    Future.microtask(() {
      controllerHome.changeIndexcatigory(1.toString());
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: GetData.getallLevel(),
          builder: (BuildContext context, AsyncSnapshot<List<Lavle>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Waitata.waitdata(context);
            } else if (snapshot.hasError) {
              return Waitata.waitdata(context);
            } else {
              List<Lavle>? userData = snapshot.data;
              return Padding(
                padding: const EdgeInsets.only(left: 7),
                child: DefaultTabController(
                  length: userData!.length,
                  child: Column(
                    children: <Widget>[
                      lisvatigory(userData),
                      sutodent(),
                    ],
                  ),
                ),
              );
            }
          },
        ),
        Consumer<HomeController>(builder: (_, a, child) {
          return FutureBuilder(
            future: GetData.getallclassa(a.nidofcatigory.toString()),
            builder:
                (BuildContext context, AsyncSnapshot<List<Classa>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Waitata.waitdata(context);
              } else if (snapshot.hasError) {
                return Waitata.waitdata(context);
              } else {
                List<Classa>? userData = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: DefaultTabController(
                    length: userData!.length,
                    child: Column(
                      children: <Widget>[
                        lisvatigory(userData),
                        sutodent(),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        }),
      ],
    );
  }

  ButtonsTabBar lisvatigory(List userData) {
    return ButtonsTabBar(
        buttonMargin: const EdgeInsets.all(6),
        onTap: (p0) {
          controllerHome.changeIndexcatigory(userData[p0].id!.toString());
        },
        backgroundColor: Colors.brown,
        unselectedBackgroundColor: const Color.fromARGB(255, 197, 197, 197),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        labelStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        tabs: userData.map((e) {
          return Tab(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                e.name.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }).toList());
  }

  Consumer<ControllerLocation> sutodent() {
    return Consumer<ControllerLocation>(builder: (context, aa, child) {
      return Consumer<HomeController>(builder: (_, a, child) {
        return FutureBuilder(
          future: GetDataPost.getall_post_Catigory(
              wilaya: "", id_classa: a.nidofcatigory.toString()),
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
              return newMethod(userData);
            }
          },
        );
      });
    });
  }

  late List<bool> isSelected;

  bool _isLoadingsave = false;
  bool _isLoadingclose = false;
  Column newMethod(List<Student>? userData) {
    isSelected = List<bool>.generate(
        userData!.length, (index) => userData[index].isPresent!.toBoolean());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          direction: Axis.vertical,
          children: List<Widget>.generate(userData!.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: FilterChip(
                  label: SizedBox(
                      width: SizeApp.widthmobile(context, size: 0.8),
                      child: Row(
                        children: [
                          imageCached(
                              image:
                                  '${UrlApp.site}images/${userData[index].image.toString()}'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(userData[index].name.toString()),
                          Spacer(),
                          Text(
                            userData[index].classs.toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )),
                  selected: isSelected[index],
                  selectedColor: Color.fromARGB(
                      255, 187, 255, 189), // Set selected color to green

                  onSelected: (bool selected) {
                    setState(() {
                      isSelected[index] = selected;
                    });
                  },
                ),
              ),
            );
          }),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isLoadingsave = true;
              });
              List<String> selectedStudents = [];
              for (int i = 0; i < isSelected.length; i++) {
                if (isSelected[i] == true && userData[i].isPresent != "true") {
                  pushNotification(
                          id: "1",
                          title: "اشعار حضور",
                          description:
                              "     لقد حضر ابنك  ${userData[i].name} ",
                          post_id: userid.read('iduser'))
                      .then((value) {
                    snackBar(context,
                        message: "تم ارسال اشعار بدخول التلاميذ",
                        color: Colors.green);
                  });
                  upIsPresent(userData[i].id.toString(), isSelected[i]);
                }
              }
              setState(() {
                _isLoadingsave = false;
              });
            },
            child: _isLoadingsave == true
                ? Text(' تتم عملية الحفظ')
                : Text('تحديث الجضور'),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isLoadingclose = true;
              });
              List<String> selectedStudents = [];
              for (int i = 0; i < isSelected.length; i++) {
                selectedStudents.add(userData[i].id.toString());
                if (userData[i].isPresent == "true") {
                  pushNotification(
                          id: "1",
                          title: "اشعار خرج",
                          description: " ${userData[i].name} لقد خرج ابنك",
                          post_id: userid.read('iduser'))
                      .then((value) {
                    snackBar(context,
                        message: "تم ارسال اشعار بخروج التلاميذ",
                        color: Colors.red);
                  });
                  if (isSelected[i] == true) {
                    upIsPresent(userData[i].id.toString(), false);
                  }

                  setState(() {
                    _isLoadingclose = false;
                  });
                }
              }

              print("Selected Students: $selectedStudents");
              print("complet");
            },
            child: _isLoadingclose == true
                ? Text(' تتم عملية الحفظ')
                : Text('خروج كل التلاميذ'),
          ),
        ),
      ],
    );
  }
}
