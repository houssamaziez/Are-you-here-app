import 'package:app/App/Controller/homeController.dart';

import 'import_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const MyBottomBar(),
        key: _scaffoldKey,
        appBar: myAppBar(
          context,
          _scaffoldKey,
        ),
        drawer: myDrawer(context),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: Container(
            child: Consumer<HomeController>(
              builder: (context, myNotifier, child) {
                return myNotifier.screens[myNotifier.index];
              },
            ),
          ),
        ));
  }
}
