import 'package:app/App/Controller/PostController.dart';
import 'package:app/App/View/Home/Screens/ScreenSearch/widgets/listview.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../../Admine/Parents/addparent.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  Future<void> refreshList() async {
    // Simulate a network request delay
    await Future.delayed(Duration(milliseconds: 500));

    // Update the state of the app
    // In a real app, you would typically make a network request here
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      theme: const PieTheme(
        rightClickShowsMenu: true,
        tooltipTextStyle: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text('قائمة كل الاولياء'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Go.to(context, AddParent());
                },
                icon: Icon(Icons.add),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          backgroundColor: Color.fromARGB(255, 254, 253, 253),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: RefreshIndicator(
              onRefresh: refreshList,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      elevation: 0,
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      title: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 209, 209, 209),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 237, 237, 237),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14))),
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
                                    Provider.of<PostController>(context,
                                            listen: false)
                                        .onChanged(value);
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
                    Consumer<PostController>(
                        builder: (context, myNotifier, child) {
                      return allPostsearch(context, myNotifier.query);
                    }),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
