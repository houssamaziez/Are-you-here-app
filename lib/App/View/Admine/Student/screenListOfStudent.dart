import 'package:app/App/Controller/locationController.dart';
import 'package:app/App/Service/FutureBuild/list_of_catigorys.dart';

import 'package:app/App/util/Size/dimensions.dart';
import 'package:pie_menu/pie_menu.dart';
import '../../../../main.dart';
import '../../Home/import_home.dart';

class ScreenStudentList extends StatefulWidget {
  const ScreenStudentList({super.key});

  @override
  State<ScreenStudentList> createState() => _ScreenStudentListState();
}

class _ScreenStudentListState extends State<ScreenStudentList> {
  @override
  void initState() {
    Provider.of<HomeController>(context, listen: false).updatelegth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var controllerlocation = Provider.of<ControllerLocation>(context);

    return PieCanvas(
      theme: const PieTheme(
        rightClickShowsMenu: true,
        tooltipTextStyle: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizeApp.sizedboxh50,
          titlehome(),
          SizeApp.sizedboxh20,
          // StudentsToggleBu(
          //   students: [],
          // ),
        ],
      )),
    );
  }

  Padding titlehome() {
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
}
