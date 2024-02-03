import 'dart:async';

import 'package:app/App/Controller/myappcontroller.dart';
import 'package:app/App/Model/user.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/View/Home/Home.dart';
import 'package:app/App/View/Welcome/inistateWelcome.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenWelcome extends StatefulWidget {
  const ScreenWelcome({super.key});

  @override
  State<ScreenWelcome> createState() => _ScreenWelcomeState();
}

class _ScreenWelcomeState extends State<ScreenWelcome> {
  MyAppController? myData;

  @override
  void initState() {
    super.initState();
    InistateWelcome.inis().then((value) {
      if (value != null) {
        myData!.updateData(value);
        Timer(Duration(seconds: 1), () {
          Go.push(Home());
        });
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    myData = Provider.of<MyAppController>(context);

    return Scaffold(
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
