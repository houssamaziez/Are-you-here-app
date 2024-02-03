import 'import_home.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
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
        appBar: myAppBar(context, _scaffoldKey),
        drawer: myDrawer(context),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: Container(),
        ));
  }
}
