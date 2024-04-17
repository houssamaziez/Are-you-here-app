import 'package:app/App/View/Welcome/inistateWelcome.dart';

import '../../Controller/PresentController.dart';
import '../../Service/Api/Function/Put/user.dart';
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
        bottomNavigationBar: MyBottomBar(),
        key: _scaffoldKey,
        // appBar: AppBar(
        //   title: Text(userDataapp!.role.toString()),
        // ),
        // appBar: myAppBar(
        //   context,
        //   _scaffoldKey,
        // ),
        // drawer: myDrawer(context),
        body: Consumer<HomeController>(
          builder: (context, myNotifier, child) {
            return userDataapp!.role.toString() == "admine"
                ? myNotifier.screens1[myNotifier.index]
                : myNotifier.screens2[myNotifier.index];
          },
        ));
  }
}
