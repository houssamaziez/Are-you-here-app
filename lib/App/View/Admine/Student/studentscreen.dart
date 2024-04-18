import 'package:app/App/Model/post.dart';
import 'package:app/App/View/Admine/Student/screenAdd.dart';
import 'package:app/App/View/Widgets/WaitDataWidgets/list_of_post.dart';

import 'package:bottom_bar_matu/utils/app_utils.dart';

import '../../../../main.dart';
import '../../../Model/classa.dart';
import '../../../Service/Api/Function/Get/getdata.dart';
import '../../../Service/Api/Function/PostFunction/getdata.dart';
import '../../Home/import_home.dart';
import '../../Widgets/WaitDataWidgets/wait_data.dart';

class ScreenAllStudent extends StatefulWidget {
  ScreenAllStudent(
      {super.key,
      required this.id_classa,
      required this.lavelId,
      required this.classa});
  final String id_classa;
  final String lavelId;
  final Classa classa;

  @override
  State<ScreenAllStudent> createState() => _ScreenAllStudentState();
}

class _ScreenAllStudentState extends State<ScreenAllStudent> {
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
        title: Text("التلاميذ"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Go.to(
                    context,
                    CreateStudentScreen(
                        classa: widget.classa,
                        userId: "1".toInt(),
                        lavelId: widget.lavelId.toInt(),
                        classaId: widget.id_classa.toInt()));
              },
              icon: Icon(Icons.add)),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: FutureBuilder(
        future: GetData.getallclassa(widget.id_classa),
        builder: (BuildContext context, AsyncSnapshot<List<Classa>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Waitata.waitdata(context);
          } else if (snapshot.hasError) {
            return Waitata.waitdata(context);
          } else {
            return sutodent(widget.id_classa, widget.classa);
          }
        },
      ),
    );
  }

  sutodent(id_classa, classa) {
    return FutureBuilder(
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
          List<Student>? students = snapshot.data;
          return StudentsToggleBu(
            students: students!,
            classa: classa,
          );
        }
      },
    );
  }
}
