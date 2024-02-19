// ignore_for_file: sort_child_properties_last

import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Service/Api/Function/Get/getdata.dart';
import 'package:app/App/Service/FutureBuild/list_of_postCatigory.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class ListOfCatigorys extends StatefulWidget {
  const ListOfCatigorys({super.key});

  @override
  State<ListOfCatigorys> createState() => _ListOfCatigorysState();
}

class _ListOfCatigorysState extends State<ListOfCatigorys> {
  List<Widget> list = [
    const Tab(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "..............",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Tab(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "..............",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Tab(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "..............",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Tab(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "..............",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Tab(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "..............",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ];

  Widget returndatawidegtPost() {
    int index = 1;
    return Column(
      children: [
        FutureBuilder(
          future: GetData.getallCatigorys(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Catigorys>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return waitdata();
            } else if (snapshot.hasError) {
              // Show an error message if the data fetching fails
              return waitdata();
            } else {
              // Build your UI based on the fetched data
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
                            setState(() {
                              index = userData[p0].id!.toInt();
                            });
                            print(index);
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
                              iconMargin: const EdgeInsets.only(bottom: 40.0),
                            );
                          }).toList()),
                    ],
                  ),
                ),
              );
            }
          },
        ),
        ListOfPostCatigory(idcatigory: index.toString())
      ],
    );
  }

  Padding waitdata() {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: DefaultTabController(
        length: list.length,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
                buttonMargin: const EdgeInsets.all(6),
                backgroundColor: Colors.brown,
                unselectedBackgroundColor:
                    const Color.fromARGB(255, 197, 197, 197),
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: list.toList()),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return returndatawidegtPost();
  }
}
