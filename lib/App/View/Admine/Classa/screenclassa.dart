import 'package:app/App/Controller/locationController.dart';
import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Service/FutureBuild/list_of_catigorys.dart';
import 'package:app/App/Service/ImageCach/imagecach.dart';
import 'package:app/App/View/Admine/Classa/addclassa.dart';
import 'package:app/App/View/Admine/Student/studentscreen.dart';
import 'package:app/App/util/Const/url.dart';

import 'package:app/App/util/Size/dimensions.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../../Model/classa.dart';
import '../../../Service/Api/Function/Get/getdata.dart';
import '../../Home/import_home.dart';
import '../../Widgets/WaitDataWidgets/wait_data.dart';

class ScreenAllclassa extends StatefulWidget {
  ScreenAllclassa({super.key, required this.id_lavel});
  final String id_lavel;

  @override
  State<ScreenAllclassa> createState() => _ScreenAllclassaState();
}

class _ScreenAllclassaState extends State<ScreenAllclassa> {
  lisvatigory(List<Classa> userData) {
    return RefreshIndicator(
      onRefresh: refreshList,
      child: GridView.builder(
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
                    ScreenAllStudent(
                      classa: userData[index],
                      id_classa: userData[index].id.toString(),
                      lavelId: userData[index].lavelId.toString(),
                    ));
              },
              child: Card(
                child: Container(
                    decoration: BoxDecoration(borderRadius: SizeApp.raduis(11)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: imageCached(
                              image:
                                  "${UrlApp.site}im/undraw_Content_structure_re_ebkv-removebg.png",
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
      ),
    );
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  Future<void> refreshList() async {
    // Simulate a network request delay
    await Future.delayed(Duration(milliseconds: 500));

    // Update the state of the app
    // In a real app, you would typically make a network request here
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("الاقسام"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Go.to(context,
                    AddClassaScreen(id_lavel: widget.id_lavel.toInt()));
              },
              icon: Icon(Icons.add)),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: FutureBuilder(
        future: GetData.getallclassa(widget.id_lavel),
        builder: (BuildContext context, AsyncSnapshot<List<Classa>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Waitata.waitdata(context);
          } else if (snapshot.hasError) {
            return Waitata.waitdata(context);
          } else {
            List<Classa>? userData = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(left: 7),
              child: lisvatigory(userData!),
            );
          }
        },
      ),
    );
  }
}
