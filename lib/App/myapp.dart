import 'package:app/App/View/Welcome/screenweclom.dart';
import 'package:app/App/util/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'View/Admine/Lavel/screenAllLavel.dart';
import 'View/Admine/Parents/screenParents.dart';
import 'View/Welcome/Start/ScreennStart.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: light,
      // home: userid.read('iduser') == null ? ScreenSignin() : ScreenHome(),
      home: ScreenWelcome(),
    );
  }
}
