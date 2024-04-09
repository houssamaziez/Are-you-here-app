import 'package:app/App/Controller/catigoryController.dart';
import 'package:app/App/View/Home/Screens/Notification/Widgets/listview.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/util/Size/dimensions.dart';

class ScreenNotification extends StatelessWidget {
  const ScreenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Notification',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ListView(
            children: [
              SizeApp.sizedboxh20,
              Consumer<CatigorysController>(
                  builder: (context, myNotifier, child) {
                return listOfNotification();
              })
            ],
          ),
        ));
  }
}
