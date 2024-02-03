import 'package:app/App/Controller/myappcontroller.dart';
import 'package:app/App/Model/user.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/util/Image/get_image_user.dart';
import 'package:app/App/util/Image/icons.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:app/App/util/theme/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  MyAppController? myData;
  @override
  void initState() {
    if (userid.read('iduser') == null) {
    } else {}
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    load();
    return true;
  }

  int get count => list.length;

  List<int> list = [];
  void load() {
    print("load");
    setState(() {
      list.addAll(List.generate(5, (v) => v));
      print("data count = ${list.length}");
    });
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    list.clear();
    load();
  }

  @override
  Widget build(BuildContext context) {
    myData = Provider.of<MyAppController>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: MyIcons.menu(() {
          _scaffoldKey.currentState?.openDrawer();
        }),
        title: const Text(
          'Home',
          style: StyleApp.title,
        ),
        centerTitle: true,
        actions: [
          GetImageUser.returnimageiser(
              nameofuser: myData!.userdata!.user!.name.toString()),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            GetImageUser.returnimageiser(
                nameofuser: myData!.userdata!.user!.name.toString()),
            Text(myData!.userdata!.user!.name.toString()),
            Text(myData!.userdata!.user!.email.toString()),
            InkWell(
                onTap: () async {
                  await userid
                      .write('iduser', null)
                      .then((value) => Go.push(ScreenSignin()));
                },
                child: ListTile(
                  title: Text("Logout "),
                ))
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: LoadMore(
          isFinish: count >= 60,
          onLoadMore: _loadMore,
          whenEmptyLoad: true,
          delegate: const DefaultLoadMoreDelegate(),
          textBuilder: DefaultLoadMoreTextBuilder.chinese,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
                subtitle: Text('The value: ${list[index]}'),
              );
            },
            itemCount: count,
          ),
        ),
      ),
    );
  }
}
