// ignore_for_file: sort_child_properties_last

import 'package:app/App/Controller/locationController.dart';
import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Model/post.dart';
import 'package:app/App/Service/Api/Function/Delete/delete.dart';
import 'package:app/App/Service/Api/Function/Get/getdata.dart';
import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
import 'package:app/App/View/Home/Profile/ProfileUser/profialPost.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/WaitDataWidgets/list_of_post.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:pie_menu/pie_menu.dart';

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
  String index = "1";

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
                            return listofpost(userData);
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

  GridView listofpost(List<Posts>? userData) {
    return GridView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // This line prevents scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.85),
      shrinkWrap: true,
      itemCount: userData!.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PieMenu(
              onPressed: () =>
                  Go.to(context, ProfilePost(post: userData[index])),
              actions: [
                PieAction(
                  tooltip: const Text('Delelte'),
                  onSelect: () =>
                      ApiDelete.deleteData(userData[index].id.toString())
                          .then((value) => setState(() {})),
                  child: const Icon(Icons.delete), // Can be any widget
                ),
                PieAction(
                  tooltip: const Text('like'),
                  onSelect: () =>
                      ApiDelete.deleteData(userData[index].id.toString()),
                  child: const Icon(Icons.favorite), // Can be any widget
                ),
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: userData[index].id.toString(),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.5),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border_rounded,
                                          color: Colors.brown,
                                          weight: 0.1,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(UrlApp.site +
                                    userData[index].image.toString())),
                            borderRadius: SizeApp.raduis(11)),
                        width: SizeApp.widthmobile(context, size: 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData[index].title.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          '\$${userData[index].price}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
