// ignore_for_file: sort_child_properties_last

import 'package:app/App/Controller/locationController.dart';
import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Model/post.dart';
import 'package:app/App/Service/Api/Function/Delete/delete.dart';
import 'package:app/App/Service/Api/Function/Get/getdata.dart';
import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
import 'package:app/App/Service/FutureBuild/list_of_post_user.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/WaitDataWidgets/list_of_post.dart';
import 'package:app/App/View/Widgets/cardpost.dart';
import 'package:app/App/View/Widgets/WaitDataWidgets/wait_data.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

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
    controllerHome.changeIndexcatigory(1.toString());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetData.getallCatigorys(),
      builder: (BuildContext context, AsyncSnapshot<List<Catigorys>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Waitata.waitdata();
        } else if (snapshot.hasError) {
          return Waitata.waitdata();
        } else {
          List<Catigorys>? userData = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(left: 7),
            child: DefaultTabController(
              length: userData!.length,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                      buttonMargin: const EdgeInsets.all(6),
                      onTap: (p0) {
                        controllerHome
                            .changeIndexcatigory(userData[p0].id!.toString());
                      },
                      backgroundColor: Colors.brown,
                      unselectedBackgroundColor:
                          const Color.fromARGB(255, 197, 197, 197),
                      unselectedLabelStyle:
                          const TextStyle(color: Colors.black),
                      labelStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      tabs: userData.map((Catigorys e) {
                        return Tab(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e.name.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }).toList()),
                  Consumer<ControllerLocation>(builder: (context, aa, child) {
                    return Consumer<HomeController>(builder: (_, a, child) {
                      return FutureBuilder(
                        future: GetDataPost.getall_post_Catigory(
                            id_catigory: a.nidofcatigory.toString(),
                            wilaya:
                                userwilaya.read('wilaya') ?? aa.selectedWilaya),
                        // initialData: InitialData,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return waitdatapost(context);
                          } else if (snapshot.hasError) {
                            // Show an error message if the data fetching fails
                            return waitdatapost(context);
                          } else {
                            // Build your UI based on the fetched data
                            List<Posts>? userData = snapshot.data;
                            return listofpost(
                              userData,
                            );
                          }
                        },
                      );
                    });
                  }),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
