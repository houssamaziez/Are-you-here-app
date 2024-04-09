import 'package:app/App/Controller/locationController.dart';
import 'package:app/App/Service/FutureBuild/list_of_catigorys.dart';
import 'package:app/App/View/Home/All%20Catigory/screenAllCatigorys.dart';
import 'package:app/App/View/Home/Screens/Notification/screenNotification.dart';
import 'package:app/App/View/Home/Screens/ScreenSearch/screenSearch.dart';

import 'package:app/App/util/Size/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../import_home.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    Provider.of<HomeController>(context, listen: false).updatelegth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controllerlocation = Provider.of<ControllerLocation>(context);

    return PieCanvas(
      theme: const PieTheme(
        rightClickShowsMenu: true,
        tooltipTextStyle: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizeApp.sizedboxh50,
            appbarhome(controllerlocation, context),
            searchwidget(context),
            publication(context),
            titlehome(),
            const ListOfCatigorys(),
          ],
        ),
      )),
    );
  }

  Padding titlehome() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          const Text(
            "Catigorys",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                Go.to(context, const ScreenAllCatigorys());
              },
              child: const Text(
                "See All",
                style: TextStyle(color: Colors.brown),
              )),
        ],
      ),
    );
  }

  Padding publication(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 230, 253, 165),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        width: double.infinity,
        height: 155,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: SizeApp.widthmobile(context, size: 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'New Collection',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Discouunnt 50% for the first transaction',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                        ),
                        MaterialButton(
                          height: 30,
                          color: Colors.brown,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: const Text(
                            'Shop Now',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Image.network(
                  "https://freepngimg.com/download/fashion/139515-blue-eyes-shopping-vector-smiling-girl.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding searchwidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () => Go.to(
              context,
              ScreenSearch(),
            ),
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 209, 209, 209),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 237, 237, 237),
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.brown,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: Colors.brown,
              radius: 20,
              child: InkWell(
                onTap: () => Go.to(
                  context,
                  ScreenSearch(),
                ),
                child: const Icon(
                  Icons.filter_alt_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row appbarhome(ControllerLocation controllerlocation, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Location",
                style: TextStyle(color: Colors.grey),
              ),
              InkWell(
                onTap: () {
                  controllerlocation.showWilayaMenu(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.location_on_rounded,
                          color: Colors.brown,
                        ),
                      ),
                      Consumer<ControllerLocation>(
                          builder: (context, a, child) {
                        return Container(
                            child: Center(
                                child: Text(
                          userwilaya.read('wilaya') ?? a.selectedWilaya,
                          style: const TextStyle(color: Colors.black),
                        )));
                      }),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child:
              Consumer<HomeController>(builder: (context, myNotifier, child) {
            return Stack(
              children: [
                CircleAvatar(
                  radius: 19,
                  backgroundColor: const Color.fromARGB(255, 184, 184, 184),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          myNotifier.removelegth();
                          Go.to(context, ScreenNotification());
                        },
                        icon: const Icon(
                          Icons.notification_important,
                          color: Colors.black,
                          size: 18,
                        )),
                  ),
                ),
                myNotifier.langthnotification == '0'
                    ? Container()
                    : Positioned(
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 8,
                          child: Text(
                            myNotifier.langthnotification,
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                      )
              ],
            );
          }),
        )
      ],
    );
  }
}
