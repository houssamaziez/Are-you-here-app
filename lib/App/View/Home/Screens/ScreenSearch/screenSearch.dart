import 'package:app/App/Controller/PostController.dart';
import 'package:app/App/Controller/catigoryController.dart';
import 'package:app/App/View/Home/All%20Catigory/Widgets/listview.dart';
import 'package:app/App/View/Home/Screens/ScreenSearch/widgets/listview.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:pie_menu/pie_menu.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    var controllerlocation = Provider.of<PostController>(context);

    return PieCanvas(
      theme: const PieTheme(
        rightClickShowsMenu: true,
        tooltipTextStyle: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Container(
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
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.search,
                        color: Colors.brown,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextField(
                        onChanged: (value) {
                          controllerlocation.onChanged(value);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          // Remove underline by setting border to InputBorder.none

                          border: InputBorder.none,
                        ),
                      ))
                      // Text(
                      //   'Search',
                      //   style: TextStyle(color: Colors.grey, fontSize: 17),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView(
              children: [
                Consumer<PostController>(builder: (context, myNotifier, child) {
                  return allPostsearch(context, myNotifier.query);
                })
              ],
            ),
          )),
    );
  }
}
