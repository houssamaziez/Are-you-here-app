import 'package:app/App/Controller/locationController.dart';
import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Service/ImageCach/imagecach.dart';
import 'package:app/App/View/Admine/Classa/screenclassa.dart';
import 'package:app/App/util/Const/url.dart';

import 'package:app/App/util/Size/dimensions.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../../Service/Api/Function/Get/getdata.dart';
import '../../Home/import_home.dart';
import '../../Widgets/WaitDataWidgets/wait_data.dart';

class ScreenAllLavel extends StatelessWidget {
  ScreenAllLavel({super.key});

  Padding titlehome(context) {
    var controllerlocation = Provider.of<ControllerLocation>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          // TextButton(
          //   onPressed: () {
          //     Go.to(context, const ScreenAllCatigorys());
          //   },
          //   child: ElevatedButton(
          //     onPressed: () {
          //       controllerlocation.showWilayaMenu(context);
          //     },
          //     child: Consumer<ControllerLocation>(builder: (context, a, child) {
          //       return SizedBox(
          //           width: 100,
          //           height: 50,
          //           child: Center(
          //               child: Text(
          //             a.selectedWilaya,
          //           )));
          //     }),
          //   ),
          // ),
          const Spacer(),
          const Text(
            "تحديد الطلبة الحاضرين",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 10,
          )
        ],
      ),
    );
  }

  lisvatigory(List<Lavle> userData) {
    List<String> image = [
      "${UrlApp.site}im/Kindergarten%20student-amico.png",
      "${UrlApp.site}im/Kindergarten%20student-bro.png",
      "${UrlApp.site}im/Kindergarten%20student-cuate.png",
      "${UrlApp.site}im/Kindergarten%20student-pana.png",
      "${UrlApp.site}im/Kindergarten%20student-rafiki.png",
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.85),
      shrinkWrap: true,
      itemCount: userData.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Go.to(
                  context,
                  ScreenAllclassa(
                    id_lavel: userData[index].id.toString(),
                  ));
            },
            child: Card(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: SizeApp.raduis(11)),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: imageCached(
                            image: image[index],
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Center(
                              child: Text(
                            userData[index].name.toString(),
                            style: TextStyle(fontSize: 17),
                          ))),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 253, 253),
      appBar: AppBar(
        elevation: 0,
        title: Text("المراحلة الدراسية"),
        centerTitle: true,
        actions: [
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: GetData.getallLevel(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Lavle>> snapshot) {
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
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
