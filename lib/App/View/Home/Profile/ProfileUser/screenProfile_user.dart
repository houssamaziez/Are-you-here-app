import 'package:app/App/Service/Api/Function/show_data.dart';
import 'package:app/App/Service/FutureBuild/list_of_post_user.dart';
import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';

class ScreenProfileUser extends StatefulWidget {
  const ScreenProfileUser({super.key, this.idusr});
  final idusr;
  @override
  State<ScreenProfileUser> createState() => _ScreenProfileUserState();
}

class _ScreenProfileUserState extends State<ScreenProfileUser> {
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
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
        body: Column(children: [
          returndataUserImage(widget.idusr),
          const Text("email:"),
          const Text("phone:"),
          const Text("wilaya:"),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: Container(
                  child: ListOfPostUser(
                iduser: widget.idusr,
              )),
            ),
          )
        ]),
      ),
    );
  }
}
