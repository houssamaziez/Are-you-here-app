import 'package:app/App/Controller/catigoryController.dart';
import 'package:app/App/View/Home/Screens/Notification/Widgets/listview.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/snackBar.dart';
import 'package:app/App/util/Size/dimensions.dart';

class ScreenNotification extends StatefulWidget {
  const ScreenNotification({super.key});

  @override
  State<ScreenNotification> createState() => _ScreenNotificationState();
}

class _ScreenNotificationState extends State<ScreenNotification> {
  @override
  void dispose() {
    super.dispose();
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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'الاشعارات',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: RefreshIndicator(
            onRefresh: refreshList,
            child: ListView(
              children: [
                SizeApp.sizedboxh20,
                Consumer<CatigorysController>(
                    builder: (context, myNotifier, child) {
                  return listOfNotification();
                })
              ],
            ),
          ),
        ));
  }
}
