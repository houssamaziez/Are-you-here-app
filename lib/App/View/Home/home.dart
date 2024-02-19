import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
import 'package:app/App/View/Home/Screens/ScreenHome/screen_home.dart';

import 'import_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const MyBottomBar(),
        key: _scaffoldKey,
        // appBar: myAppBar(
        //   context,
        //   _scaffoldKey,
        // ),
        drawer: myDrawer(context),
        body: Consumer<HomeController>(
          builder: (context, myNotifier, child) {
            return myNotifier.screens[myNotifier.index];
          },
        ));
  }
}
