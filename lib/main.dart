import 'dart:async';

import 'package:app/App/Controller/listofProvider.dart';
import 'package:app/App/Model/classa.dart';
import 'package:app/App/Model/post.dart';
import 'package:app/App/Service/Api/Function/Notification/push.dart';
import 'package:app/App/Service/Api/Function/Put/presont.dart';
import 'package:app/App/Service/ImageCach/imagecach.dart';
import 'package:app/App/View/Admine/Student/studentscreen.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/dialogs.dart';
import 'package:app/App/View/Widgets/snackBar.dart';
import 'package:app/App/myapp.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:app/firebase_options.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    // تقييد التوجهات المفضلة
    DeviceOrientation.portraitUp, // العمودي فقط
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: listofprovider,
        child: const MyApp(),
      ),
    );
  });

  // userid.write('iduser', null);
}

class StudentsToggleBu extends StatefulWidget {
  final List<Student> students;
  final Classa classa;
  StudentsToggleBu({super.key, required this.students, required this.classa});
  @override
  _StudentsToggleBuState createState() => _StudentsToggleBuState();
}

class _StudentsToggleBuState extends State<StudentsToggleBu> {
  late List<bool> isSelected;

  @override
  void initState() {
    print(widget.students.length);
    super.initState();
    isSelected = List<bool>.generate(widget.students.length,
        (index) => widget.students[index].isPresent.toBoolean());
  }

  bool _isLoadingsave = false;
  bool _isLoadingclose = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            children: List<Widget>.generate(widget.students.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onLongPress: () async {
                    await showDeleteConfirmationDialog(context,
                        'student/delete/${widget.students[index].id.toString()}',
                        title: "حذف ${widget.students[index].name}");
                    Go.back(ScreenAllStudent(
                        id_classa: widget.classa.id.toString(),
                        lavelId: widget.students[index].lavelId.toString(),
                        classa: widget.classa));
                  },
                  child: SizedBox(
                    child: FilterChip(
                      label: SizedBox(
                          child: Row(
                        children: [
                          imageCached(
                              image:
                                  '${UrlApp.site}images/${widget.students[index].image.toString()}'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(widget.students[index].name.toString()),
                          Spacer(),
                          Text(
                            widget.students[index].classs.toString(),
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
                  if (isSelected[i] == true &&
                      widget.students[i].isPresent != "true") {
                    pushNotification(
                            id: "1",
                            title: "اشعار حضور",
                            description:
                                "     لقد حضر ابنك  ${widget.students[i].name} ",
                            post_id: userid.read('iduser'))
                        .then((value) {
                      snackBar(context,
                          message: "تم ارسال اشعار بدخول التلاميذ",
                          color: Colors.green);
                    });
                    upIsPresent(
                        widget.students[i].id.toString(), isSelected[i]);
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
                  selectedStudents.add(widget.students[i].id.toString());
                  if (widget.students[i].isPresent == "true") {
                    pushNotification(
                            id: "1",
                            title: "اشعار خرج",
                            description:
                                " ${widget.students[i].name} لقد خرج ابنك",
                            post_id: userid.read('iduser'))
                        .then((value) {});
                    if (isSelected[i] == true) {
                      upIsPresent(widget.students[i].id.toString(), false);
                    }
                  }
                }
                setState(() {
                  _isLoadingclose = false;
                });
                snackBar(context,
                    message: "تم ارسال اشعار بخروج التلاميذ",
                    color: Colors.red);
                Navigator.pop(context);
                print("Selected Students: $selectedStudents");
                print("complet");
              },
              child: _isLoadingclose == true
                  ? Text(' تتم عملية الحفظ')
                  : Text('خروج كل التلاميذ'),
            ),
          ),
        ],
      ),
    );
  }
}
